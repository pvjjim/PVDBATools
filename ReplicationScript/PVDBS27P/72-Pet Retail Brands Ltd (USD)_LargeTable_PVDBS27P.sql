-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'NAVII_OTHER', @optname = N'publish', @value = N'true'
GO

exec [NAVII_OTHER].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [NAVII_OTHER]
exec sp_addpublication @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @description = N'Transactional publication of database ''NAVII_OTHER'' from Publisher ''PVCO01P-NAV\NAV''.', @sync_method = N'concurrent', @retention = 36, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 140000, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS33P'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0007'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0008'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS39P'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS27P'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQLSENTRY'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\ptangwai'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\Local Admin - Database Servers'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_PVDBS44P'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\srvc_veeam'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\CBTS_GROUP'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\joinonen'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\ejiang'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0001'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @login = N'NT SERVICE\MSSQLSERVER'
GO

-- Adding the transactional articles
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Country_Region', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Country_Region', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Country_Region', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Country_Region]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Country_Region]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Country_Region]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Gen_ Product Posting Group', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Gen_ Product Posting Group', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Gen_ Product Posting Group', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Gen_ Product Posting Group]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Gen_ Product Posting Group]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Gen_ Product Posting Group]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Inventory Posting Group', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Inventory Posting Group', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Inventory Posting Group', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Inventory Posting Group]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Inventory Posting Group]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Inventory Posting Group]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Item Category Manager', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Item Category Manager', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Item Category Manager', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Item Category Manager]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Item Category Manager]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Item Category Manager]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Sub-Category', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Sub-Category', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Sub-Category', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Sub-Category]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Sub-Category]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Sub-Category]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Tax Group', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Tax Group', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Tax Group', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Tax Group]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Tax Group]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Tax Group]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @article = N'72-Pet Retail Brands Ltd (USD)$Trans_ Infocode Entry', @source_owner = N'dbo', @source_object = N'72-Pet Retail Brands Ltd (USD)$Trans_ Infocode Entry', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000000030073, @identityrangemanagementoption = N'none', @destination_table = N'72-Pet Retail Brands Ltd (USD)$Trans_ Infocode Entry', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbo72-Pet Retail Brands Ltd (USD)$Trans_ Infocode Entry]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbo72-Pet Retail Brands Ltd (USD)$Trans_ Infocode Entry]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbo72-Pet Retail Brands Ltd (USD)$Trans_ Infocode Entry]'
GO

-- Adding the transactional subscriptions
use [NAVII_OTHER]
exec sp_addsubscription @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @subscriber = N'PVD37P', @destination_db = N'NAVII_OTHER', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'72-Pet Retail Brands Ltd (USD)_LargeTable_PVDBS27P', @subscriber = N'PVD37P', @subscriber_db = N'NAVII_OTHER', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

