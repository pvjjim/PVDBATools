-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'NAVII_26', @optname = N'publish', @value = N'true'
GO

exec [NAVII_26].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [NAVII_26]
exec sp_addpublication @publication = N'26-PVCFI_LargeTable_PVDBS24P', @description = N'Transactional publication of database ''NAVII_26'' from Publisher ''PVCO01P-NAV\NAV''.', @sync_method = N'concurrent', @retention = 36, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'26-PVCFI_LargeTable_PVDBS24P', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\NAVII_AGP32'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS32P'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS33P'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS37P'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS39P'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\SRVC_SQLSENTRY'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\ptangwai'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\Local Admin - Database Servers'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\srvc_veeam'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\CBTS_GROUP'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\abutterf'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\pwang'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'DOMAIN-A\NAVII_Aqua_DBAGPs'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'26-PVCFI_LargeTable_PVDBS24P', @login = N'NT SERVICE\MSSQLSERVER'
GO

-- Adding the transactional articles
use [NAVII_26]
exec sp_addarticle @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @source_owner = N'dbo', @source_object = N'26-PVCFI$Actions', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'26-PVCFI$Actions', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo26-PVCFI$Actions]', @del_cmd = N'CALL [sp_MSdel_dbo26-PVCFI$Actions]', @upd_cmd = N'SCALL [sp_MSupd_dbo26-PVCFI$Actions]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Entry No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Location Group Filter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Action', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Table No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Key', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'BatchID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Actions', @view_name = N'syncobj_0x3135394536353234', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_26]
exec sp_addarticle @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Item Category Manager', @source_owner = N'dbo', @source_object = N'26-PVCFI$Item Category Manager', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'26-PVCFI$Item Category Manager', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo26-PVCFI$Item Category Manager]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo26-PVCFI$Item Category Manager]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo26-PVCFI$Item Category Manager]'
GO
use [NAVII_26]
exec sp_addarticle @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Sub-Category', @source_owner = N'dbo', @source_object = N'26-PVCFI$Sub-Category', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'26-PVCFI$Sub-Category', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo26-PVCFI$Sub-Category]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo26-PVCFI$Sub-Category]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo26-PVCFI$Sub-Category]'
GO
use [NAVII_26]
exec sp_addarticle @publication = N'26-PVCFI_LargeTable_PVDBS24P', @article = N'26-PVCFI$Trans_ Infocode Entry', @source_owner = N'dbo', @source_object = N'26-PVCFI$Trans_ Infocode Entry', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'26-PVCFI$Trans_ Infocode Entry', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo26-PVCFI$Trans_ Infocode Entry]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo26-PVCFI$Trans_ Infocode Entry]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo26-PVCFI$Trans_ Infocode Entry]'
GO

-- Adding the transactional subscriptions
use [NAVII_26]
exec sp_addsubscription @publication = N'26-PVCFI_LargeTable_PVDBS24P', @subscriber = N'PVD37P', @destination_db = N'NAVII_26', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'26-PVCFI_LargeTable_PVDBS24P', @subscriber = N'PVD37P', @subscriber_db = N'NAVII_26', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

