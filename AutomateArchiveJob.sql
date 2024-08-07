DECLARE @JobName NVARCHAR(MAX),  @JobId NVARCHAR(100), @TableName1 NVARCHAR(MAX),@TableName2 NVARCHAR(MAX), @EmailBody NVARCHAR(MAX), @EmailSubject NVARCHAR(MAX)
DECLARE @JobRunning INT, @TableCountStat INT, @TableCount1 INT, @TableCount2 INT, @jobhistoryid INT, @runstatus INT
DECLARE @JobQueue TABLE
(
 joborder int IDENTITY(1,1)NOT NULL,
 jobname NVARCHAR(100)NOT NULL
)

DECLARE @JobCounter INT =  1
DECLARE @JobStat NVARCHAR(100)
--SET @TableCountStat = 1
-----------------------------
--  ADD ARCHIVING JOBS HERE--
-----------------------------
DECLARE @ArchJob1 NVARCHAR(MAX) ='Perform-Compression PV21-7312 2023-P09 [21-Peton Distributors ULC$Warehouse Entry]'
DECLARE @ArchJob2 NVARCHAR(MAX) ='Perform-Compression PV21-7312 2023-P10 [21-Peton Distributors ULC$Warehouse Entry]'
DECLARE @ArchJob3 NVARCHAR(MAX)='Perform-Compression PV21-7312 2023-P11 [21-Peton Distributors ULC$Warehouse Entry]'
DECLARE @ArchJob4 NVARCHAR(MAX)='Perform-Compression PV21-7312 2023-P12 [21-Peton Distributors ULC$Warehouse Entry]'
DECLARE @ArchJob5 NVARCHAR(MAX)=''
DECLARE @ArchJob6 NVARCHAR(MAX)=''
DECLARE @ArchJob7 NVARCHAR(MAX)=''
DECLARE @ArchJob8 NVARCHAR(MAX)=''
DECLARE @Email NVARCHAR(MAX) ='pvdba@petvalu.com;ApplicationsOperation@petvalu.com'
----------------------------------------------------------
--Manual Work - uncomment the insert for the job queues --
----------------------------------------------------------
INSERT INTO @JobQueue (jobname) VALUES (@ArchJob1)
INSERT INTO @JobQueue (jobname) VALUES (@ArchJob2)
INSERT INTO @JobQueue (jobname) VALUES (@ArchJob3)
INSERT INTO @JobQueue (jobname) VALUES (@ArchJob4)
--INSERT INTO @JobQueue (jobname) VALUES (@ArchJob5)
--INSERT INTO @JobQueue (jobname) VALUES (@ArchJob6)
--INSERT INTO @JobQueue (jobname) VALUES (@ArchJob7)
--INSERT INTO @JobQueue (jobname) VALUES (@ArchJob8)
-----------------------------------------------------------
-- END --
-----------------------------------------------------------
select * from @JobQueue

WHILE(@JobCounter<=(select max(joborder) from @JobQueue))
BEGIN

    SET @JobName = (select jobname from @JobQueue where joborder = @JobCounter)

    IF DATEPART(hh,getdate()) < 21
    BEGIN

        EXEC msdb.dbo.sp_start_job @JobName
        SET @EmailBody = @JobName+' has Started'
        SET @EmailSubject = @JobName+' is Running' 

        SET @JobRunning =1
        EXEC msdb.dbo.sp_send_dbmail
            @recipients = @Email,
            @body = @EmailBody,
            @subject = @EmailSubject;

        WHILE @JobRunning = 1
        BEGIN
	
            SET @JobId = (select job_id  from msdb.dbo.sysjobs where name =@JobName)
            SET @JobStat = (select stop_execution_date from  msdb.dbo.sysjobactivity where job_id =@JobId and session_id =(select top 1 session_id from msdb.dbo.sysjobactivity where job_id = @JobId order by session_id desc))
	
            IF @JobStat IS NULL
            BEGIN
            SET @JobRunning = 1 
            PRINT 'job '+ @JobName +' still Running'
            INSERT INTO JobRunHistory (JobName,JobRunDate,JobRunStatus) VALUES(@JobName,getdate(),'Running')
            WAITFOR DELAY '00:00:30'
            END --IF @JobStat IS NULL
	
            IF @JobStat IS NOT NULL
            BEGIN
                SET @jobhistoryid = (SELECT job_history_id from msdb.dbo.sysjobactivity where job_id =@JobId and session_id =(select top 1 session_id from msdb.dbo.sysjobactivity where job_id = @JobId order by session_id desc))
                SET @runstatus = (SELECT run_status FROM msdb.dbo.sysjobhistory where instance_id = @jobhistoryid and step_id=0 and run_date = FORMAT(getdate(),'yyyyMMdd'))
                
                IF @runstatus = 0
                BEGIN
                    PRINT @JobName +' Failed'
                    INSERT INTO JobRunHistory (JobName,JobRunDate,JobRunStatus) VALUES(@JobName,getdate(),'Failed')
                    SET @JobRunning = 0 -- exit the loop WHILE @JobRunning = 1
                    SET @JobCounter=(select max(joborder)+1 from @JobQueue) -- exit the loop WHILE(@JobCounter<=(select max(joborder) from @JobQueue))

                    SET @EmailBody = @JobName+' '
                    SET @EmailSubject = @JobName+' Failed' 
                    EXEC msdb.dbo.sp_send_dbmail
                        @recipients = @Email,
                        @body = @EmailBody,
                        @subject = @EmailSubject;
                    BREAK;
                END --IF @runstatus = 0

                IF @runstatus = 1
                BEGIN
                    SET @JobRunning = 0 --JOB IS COMPLETE MOVE TO COUNTING TABLES
                    PRINT 'job '+ @JobName +' Completed'
                    PRINT 'Starting to Count'

                    SET @TableCountStat = 1
                    WHILE @TableCountStat = 1
                    BEGIN
                        
                        SET @TableName1 = 'SELECT @TableCount1=count(1) from NAVII_21.[dbo].['+SUBSTRING(@JobName, CHARINDEX('[', @JobName) + 1, CHARINDEX(']', @JobName) - CHARINDEX('[', @JobName) - 1) +'] WITH (NOLOCK)'
                        SET @TableName2 = 'SELECT @TableCount2=count(1) from PVD37P.NAVII_21.[dbo].['+SUBSTRING(@JobName, CHARINDEX('[', @JobName) + 1, CHARINDEX(']', @JobName) - CHARINDEX('[', @JobName) - 1) +'] WITH (NOLOCK)'
                                    
                        EXEC sp_executesql @TableName1, N'@TableCount1 int OUTPUT',@TableCount1=@TableCount1 OUTPUT;
                        EXEC sp_executesql @TableName2, N'@TableCount2 int OUTPUT',@TableCount2=@TableCount2 OUTPUT;

                        IF (@TableCount2 - @TableCount1) >=3000000
                        BEGIN
                            INSERT INTO [ReplHistory] (Message,Transdate,JobName) VALUES ('Table Count is not in sync', getdate(),@JobName)
                            INSERT INTO JobRunHistory (JobName,JobRunDate,JobRunStatus) VALUES(@JobName,getdate(),'Job Completed-Counting')
                            PRINT 'Count for' +@JobName+ 'Table Count is not in sync'
                            SET @TableCountStat = 1
                            WAITFOR DELAY '00:00:30'
                        END --IF (@TableCount2 - @TableCount1) >=100

                        IF (@TableCount2 - @TableCount1) < 3000000 --and (@TableCount2-@TableCount1) >= 0
                        BEGIN
                            INSERT INTO [ReplHistory] (Message,Transdate,JobName) VALUES ('Replication is syncronized', getdate(),@JobName)
                            INSERT INTO JobRunHistory (JobName,JobRunDate,JobRunStatus) VALUES(@JobName,getdate(),'Completed-Counts completed')
                            PRINT 'Count for' +@JobName+ 'Replication is syncronized'
                            SET @TableCountStat = 0
                        END --IF (@TableCount2 - @TableCount1) < 100
                    END --WHILE @TableCountStat = 1

                    SET @EmailBody = @JobName+' Complete'
                    SET @EmailSubject = @JobName+' Complete'
                    EXEC msdb.dbo.sp_send_dbmail
                        @recipients = @Email,
                        @body = @EmailBody,
                        @subject = @EmailSubject;

                END --IF @runstatus = 1
            END-- IF @JobStat IS NOT NULL
        END --WHILE @JobRunning = 1
    END --IF DATEPART(hh,getdate()) < 21
	
    ELSE
    BEGIN
        IF DATEPART(hh,getdate()) >= 21
        BEGIN
        
        SET @EmailBody = @JobName+' Will Not Run'
        SET @EmailSubject = @JobName+' Will Not Run' 

        
        EXEC msdb.dbo.sp_send_dbmail
            @recipients = @Email,
            @body = @EmailBody,
            @subject = @EmailSubject;
        BREAK;
        END --IF DATEPART(hh,getdate()) >= 21
	END
	SET @JobCounter += 1
	
END