-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'NAVII_OTHER', @optname = N'publish', @value = N'true'
GO

exec [NAVII_OTHER].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [NAVII_OTHER]
exec sp_addpublication @publication = N'Others_LargeTable_PVDBS27P', @description = N'Transactional publication of database ''NAVII_OTHER'' from Publisher ''PVCO01P-NAV\NAV''.', @sync_method = N'concurrent', @retention = 36, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'Others_LargeTable_PVDBS27P', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 140000, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS33P'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0007'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0008'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS39P'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS27P'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQLSENTRY'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\ptangwai'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\Local Admin - Database Servers'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_PVDBS44P'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\srvc_veeam'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\CBTS_GROUP'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\joinonen'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\ejiang'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0001'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'Others_LargeTable_PVDBS27P', @login = N'NT SERVICE\MSSQLSERVER'
GO

