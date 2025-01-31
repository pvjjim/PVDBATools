-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'NAVII_OTHER', @optname = N'publish', @value = N'true'
GO

exec [NAVII_OTHER].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [NAVII_OTHER]
exec sp_addpublication @publication = N'Others_PVDBS27P', @description = N'Transactional publication of database ''NAVII_OTHER'' from Publisher ''PVCO01P-NAV\NAV''.', @sync_method = N'concurrent', @retention = 36, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'Others_PVDBS27P', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS33P'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0007'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0008'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS39P'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS27P'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_SQLSENTRY'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\ptangwai'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\Local Admin - Database Servers'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_PVDBS44P'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\srvc_veeam'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\CBTS_GROUP'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\joinonen'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\ejiang'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'DOMAIN-A\SRVC_NAVII_0001'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'Others_PVDBS27P', @login = N'NT SERVICE\MSSQLSERVER'
GO

-- Adding the transactional articles
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'$ndo$cachesync', @source_owner = N'dbo', @source_object = N'$ndo$cachesync', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'$ndo$cachesync', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo$ndo$cachesync]', @del_cmd = N'CALL [sp_MSdel_dbo$ndo$cachesync]', @upd_cmd = N'SCALL [sp_MSupd_dbo$ndo$cachesync]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'$ndo$cachesync', @column = N'id', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'$ndo$cachesync', @column = N'Server Instance ID ', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'$ndo$cachesync', @column = N'modifiedtables', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'$ndo$cachesync', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'$ndo$cachesync', @view_name = N'syncobj_0x3935323630394231', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'$ndo$dbproperty', @source_owner = N'dbo', @source_object = N'$ndo$dbproperty', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'$ndo$dbproperty', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dbo$ndo$dbproperty]', @del_cmd = N'CALL [sp_MSdel_dbo$ndo$dbproperty]', @upd_cmd = N'SCALL [sp_MSupd_dbo$ndo$dbproperty]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'$ndo$tenantproperty', @source_owner = N'dbo', @source_object = N'$ndo$tenantproperty', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'$ndo$tenantproperty', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dbo$ndo$tenantproperty]', @del_cmd = N'CALL [sp_MSdel_dbo$ndo$tenantproperty]', @upd_cmd = N'SCALL [sp_MSupd_dbo$ndo$tenantproperty]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Access Control', @source_owner = N'dbo', @source_object = N'Access Control', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Access Control', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboAccess Control]', @del_cmd = N'CALL [sp_MSdel_dboAccess Control]', @upd_cmd = N'SCALL [sp_MSupd_dboAccess Control]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Access Control', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Access Control', @column = N'User Security ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Access Control', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Access Control', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Access Control', @column = N'Scope', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Access Control', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Access Control', @view_name = N'syncobj_0x3937463233393241', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Active Session', @source_owner = N'dbo', @source_object = N'Active Session', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Active Session', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboActive Session]', @del_cmd = N'CALL [sp_MSdel_dboActive Session]', @upd_cmd = N'SCALL [sp_MSupd_dboActive Session]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Server Instance ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Session ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'User SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Server Instance Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Server Computer Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Client Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Client Computer Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Login Datetime', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Database Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Active Session', @column = N'Session Unique ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Active Session', @view_name = N'syncobj_0x4135423546364530', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Add-in', @source_owner = N'dbo', @source_object = N'Add-in', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Add-in', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboAdd-in]', @del_cmd = N'CALL [sp_MSdel_dboAdd-in]', @upd_cmd = N'SCALL [sp_MSupd_dboAdd-in]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'Add-in Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'Public Key Token', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'Version', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'Category', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Add-in', @column = N'Resource', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Add-in', @view_name = N'syncobj_0x3443463932384338', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @source_owner = N'dbo', @source_object = N'BizTalk Suspended Queue', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'BizTalk Suspended Queue', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboBizTalk Suspended Queue]', @del_cmd = N'CALL [sp_MSdel_dboBizTalk Suspended Queue]', @upd_cmd = N'SCALL [sp_MSupd_dboBizTalk Suspended Queue]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'BizTalk Suspended Item Handle', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'Source Organization', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'Source Organization ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'Destination Organization', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'Destination Organization ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'BizTalk Schema Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @column = N'Reason Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'BizTalk Suspended Queue', @view_name = N'syncobj_0x3445303135353331', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @source_owner = N'dbo', @source_object = N'BizTalk Technical Notification', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'BizTalk Technical Notification', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboBizTalk Technical Notification]', @del_cmd = N'CALL [sp_MSdel_dboBizTalk Technical Notification]', @upd_cmd = N'SCALL [sp_MSupd_dboBizTalk Technical Notification]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Primary Key', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Initials', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Company', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Job Title', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'First Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Last Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'E-Mail', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Phone No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @column = N'Extension No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'BizTalk Technical Notification', @view_name = N'syncobj_0x3330354239303138', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Chart', @source_owner = N'dbo', @source_object = N'Chart', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Chart', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboChart]', @del_cmd = N'CALL [sp_MSdel_dboChart]', @upd_cmd = N'SCALL [sp_MSupd_dboChart]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Chart', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Chart', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Chart', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Chart', @column = N'BLOB', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Chart', @view_name = N'syncobj_0x3134363746413744', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Co41-Entry-Register-No_NAVI', @source_owner = N'dbo', @source_object = N'Co41-Entry-Register-No_NAVI', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Co41-Entry-Register-No_NAVI', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboCo41-Entry-Register-No_NAVI]', @del_cmd = N'CALL [sp_MSdel_dboCo41-Entry-Register-No_NAVI]', @upd_cmd = N'SCALL [sp_MSupd_dboCo41-Entry-Register-No_NAVI]'
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Company', @source_owner = N'dbo', @source_object = N'Company', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Company', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboCompany]', @del_cmd = N'CALL [sp_MSdel_dboCompany]', @upd_cmd = N'SCALL [sp_MSupd_dboCompany]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Company', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Company', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Company', @column = N'Is Shipping Company', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Company', @view_name = N'syncobj_0x4630334538334630', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @source_owner = N'dbo', @source_object = N'Custom Report Layout', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Custom Report Layout', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboCustom Report Layout]', @del_cmd = N'CALL [sp_MSdel_dboCustom Report Layout]', @upd_cmd = N'SCALL [sp_MSupd_dboCustom Report Layout]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Report ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Layout', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Last Modified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Last Modified by User', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'File Extension', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @column = N'Custom XML Part', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Custom Report Layout', @view_name = N'syncobj_0x3644383434424343', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @source_owner = N'dbo', @source_object = N'Debugger Breakpoint', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Debugger Breakpoint', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboDebugger Breakpoint]', @del_cmd = N'CALL [sp_MSdel_dboDebugger Breakpoint]', @upd_cmd = N'SCALL [sp_MSupd_dboDebugger Breakpoint]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Breakpoint ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Line No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Column No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'End Line No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'End Column No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Function Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Enabled', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Condition', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Session Breakpoint ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Relative Line No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Relative End Line No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @column = N'Function ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Debugger Breakpoint', @view_name = N'syncobj_0x3943364439344444', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Debugger Watch', @source_owner = N'dbo', @source_object = N'Debugger Watch', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Debugger Watch', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboDebugger Watch]', @del_cmd = N'CALL [sp_MSdel_dboDebugger Watch]', @upd_cmd = N'SCALL [sp_MSupd_dboDebugger Watch]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Watch', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Watch', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Debugger Watch', @column = N'Path', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Debugger Watch', @view_name = N'syncobj_0x3134423236423838', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Device', @source_owner = N'dbo', @source_object = N'Device', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Device', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboDevice]', @del_cmd = N'CALL [sp_MSdel_dboDevice]', @upd_cmd = N'SCALL [sp_MSupd_dboDevice]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Device', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Device', @column = N'MAC Address', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Device', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Device', @column = N'Device Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Device', @column = N'Enabled', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Device', @view_name = N'syncobj_0x3442463634333937', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Document Service', @source_owner = N'dbo', @source_object = N'Document Service', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Document Service', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboDocument Service]', @del_cmd = N'CALL [sp_MSdel_dboDocument Service]', @upd_cmd = N'SCALL [sp_MSupd_dboDocument Service]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'Service ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'Location', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'User Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'Password', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'Document Repository', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Document Service', @column = N'Folder', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Document Service', @view_name = N'syncobj_0x3633383432344131', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Integration Page', @source_owner = N'dbo', @source_object = N'Integration Page', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Integration Page', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboIntegration Page]', @del_cmd = N'CALL [sp_MSdel_dboIntegration Page]', @upd_cmd = N'SCALL [sp_MSupd_dboIntegration Page]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Integration Page', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Integration Page', @column = N'Service Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Integration Page', @column = N'Source Table ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Integration Page', @view_name = N'syncobj_0x4445423843463634', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App', @source_owner = N'dbo', @source_object = N'NAV App', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App]', @del_cmd = N'CALL [sp_MSdel_dboNAV App]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Publisher', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Version Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Version Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Version Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Version Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Compatibility Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Compatibility Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Compatibility Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Compatibility Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App', @column = N'Blob', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App', @view_name = N'syncobj_0x3134394341433035', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Capabilities', @source_owner = N'dbo', @source_object = N'NAV App Capabilities', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Capabilities', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Capabilities]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Capabilities]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Capabilities]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Capabilities', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Capabilities', @column = N'Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Capabilities', @column = N'Capability ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Capabilities', @view_name = N'syncobj_0x4236333736313032', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @source_owner = N'dbo', @source_object = N'NAV App Data Archive', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Data Archive', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Data Archive]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Data Archive]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Data Archive]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Table ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Version Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Version Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Version Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Version Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Archive Table Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @column = N'Metadata', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Data Archive', @view_name = N'syncobj_0x4545414438333630', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @source_owner = N'dbo', @source_object = N'NAV App Dependencies', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Dependencies', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Dependencies]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Dependencies]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Dependencies]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Publisher', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Version Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Version Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Version Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Version Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Compatibility Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Compatibility Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Compatibility Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @column = N'Compatibility Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Dependencies', @view_name = N'syncobj_0x3434383041334546', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @source_owner = N'dbo', @source_object = N'NAV App Installed App', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Installed App', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Installed App]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Installed App]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Installed App]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Publisher', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Version Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Version Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Version Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Version Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Compatibility Major', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Compatibility Minor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Compatibility Build', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @column = N'Compatibility Revision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Installed App', @view_name = N'syncobj_0x3641313436334545', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @source_owner = N'dbo', @source_object = N'NAV App Object Metadata', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Object Metadata', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Object Metadata]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Object Metadata]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Object Metadata]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'App Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Metadata Format', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Metadata', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'User Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'User AL Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Metadata Version', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Object Subtype', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @column = N'Object Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Object Metadata', @view_name = N'syncobj_0x4533393143334134', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Object Prerequisites', @source_owner = N'dbo', @source_object = N'NAV App Object Prerequisites', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Object Prerequisites', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Object Prerequisites]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Object Prerequisites]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Object Prerequisites]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Prerequisites', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Prerequisites', @column = N'Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Prerequisites', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Object Prerequisites', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Object Prerequisites', @view_name = N'syncobj_0x3538353732353443', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'NAV App Tenant App', @source_owner = N'dbo', @source_object = N'NAV App Tenant App', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'NAV App Tenant App', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboNAV App Tenant App]', @del_cmd = N'CALL [sp_MSdel_dboNAV App Tenant App]', @upd_cmd = N'SCALL [sp_MSupd_dboNAV App Tenant App]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Tenant App', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Tenant App', @column = N'Tenant ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'NAV App Tenant App', @column = N'App Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'NAV App Tenant App', @view_name = N'syncobj_0x4433434643333245', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Object', @source_owner = N'dbo', @source_object = N'Object', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Object', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboObject]', @del_cmd = N'CALL [sp_MSdel_dboObject]', @upd_cmd = N'SCALL [sp_MSupd_dboObject]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Modified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Compiled', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'BLOB Reference', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'BLOB Size', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'DBM Table No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Version List', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Locked', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object', @column = N'Locked By', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Object', @view_name = N'syncobj_0x3434344139343741', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @source_owner = N'dbo', @source_object = N'Object Metadata', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Object Metadata', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboObject Metadata]', @del_cmd = N'CALL [sp_MSdel_dboObject Metadata]', @upd_cmd = N'SCALL [sp_MSupd_dboObject Metadata]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Metadata', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'User Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'User AL Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Metadata Version', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Hash', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Object Subtype', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @column = N'Has Subscribers', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Object Metadata', @view_name = N'syncobj_0x3143303141434238', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @source_owner = N'dbo', @source_object = N'Object Metadata Snapshot', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Object Metadata Snapshot', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboObject Metadata Snapshot]', @del_cmd = N'CALL [sp_MSdel_dboObject Metadata Snapshot]', @upd_cmd = N'SCALL [sp_MSupd_dboObject Metadata Snapshot]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'Metadata', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'Data Per Company', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @column = N'Hash', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Object Metadata Snapshot', @view_name = N'syncobj_0x3041363035443130', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @source_owner = N'dbo', @source_object = N'Object Tracking', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Object Tracking', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboObject Tracking]', @del_cmd = N'CALL [sp_MSdel_dboObject Tracking]', @upd_cmd = N'SCALL [sp_MSupd_dboObject Tracking]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'Change Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'App Package ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'Tenant ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @column = N'Object Timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Object Tracking', @view_name = N'syncobj_0x4231333641433032', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Object Translation', @source_owner = N'dbo', @source_object = N'Object Translation', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Object Translation', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboObject Translation]', @del_cmd = N'CALL [sp_MSdel_dboObject Translation]', @upd_cmd = N'SCALL [sp_MSupd_dboObject Translation]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Translation', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Translation', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Translation', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Translation', @column = N'Language ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object Translation', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Object Translation', @view_name = N'syncobj_0x4543464230324434', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @source_owner = N'dbo', @source_object = N'Object_Change_Audit', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Object_Change_Audit', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboObject_Change_Audit]', @del_cmd = N'CALL [sp_MSdel_dboObject_Change_Audit]', @upd_cmd = N'SCALL [sp_MSupd_dboObject_Change_Audit]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'RowId', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'Activity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'When', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'Username', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'Hostname', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'ApplicationName', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Object_Change_Audit', @view_name = N'syncobj_0x3045383944434537', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @source_owner = N'dbo', @source_object = N'Page Data Personalization', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Page Data Personalization', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboPage Data Personalization]', @del_cmd = N'CALL [sp_MSdel_dboPage Data Personalization]', @upd_cmd = N'SCALL [sp_MSupd_dboPage Data Personalization]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'User SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'Personalization ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'ValueName', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @column = N'Value', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Page Data Personalization', @view_name = N'syncobj_0x3331344641363637', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Permission', @source_owner = N'dbo', @source_object = N'Permission', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Permission', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboPermission]', @del_cmd = N'CALL [sp_MSdel_dboPermission]', @upd_cmd = N'SCALL [sp_MSupd_dboPermission]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Read Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Insert Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Modify Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Delete Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Execute Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission', @column = N'Security Filter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Permission', @view_name = N'syncobj_0x3530453743433238', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Permission Set', @source_owner = N'dbo', @source_object = N'Permission Set', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Permission Set', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboPermission Set]', @del_cmd = N'CALL [sp_MSdel_dboPermission Set]', @upd_cmd = N'SCALL [sp_MSupd_dboPermission Set]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission Set', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission Set', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Permission Set', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Permission Set', @view_name = N'syncobj_0x4334413037303138', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Printer Selection', @source_owner = N'dbo', @source_object = N'Printer Selection', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Printer Selection', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboPrinter Selection]', @del_cmd = N'CALL [sp_MSdel_dboPrinter Selection]', @upd_cmd = N'SCALL [sp_MSupd_dboPrinter Selection]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Printer Selection', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Printer Selection', @column = N'User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Printer Selection', @column = N'Report ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Printer Selection', @column = N'Printer Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Printer Selection', @view_name = N'syncobj_0x4238364530364338', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Profile', @source_owner = N'dbo', @source_object = N'Profile', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Profile', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboProfile]', @del_cmd = N'CALL [sp_MSdel_dboProfile]', @upd_cmd = N'SCALL [sp_MSupd_dboProfile]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Profile ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Role Center ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Default Role Center', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Use Comments', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Use Notes', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Use Record Notes', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Record Notebook', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Use Page Notes', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Page Notebook', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile', @column = N'Disable Personalization', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Profile', @view_name = N'syncobj_0x4645303346433830', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @source_owner = N'dbo', @source_object = N'Profile Metadata', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Profile Metadata', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboProfile Metadata]', @del_cmd = N'CALL [sp_MSdel_dboProfile Metadata]', @upd_cmd = N'SCALL [sp_MSupd_dboProfile Metadata]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'Profile ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'Page ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'Personalization ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @column = N'Page Metadata Delta', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Profile Metadata', @view_name = N'syncobj_0x3044363534363033', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'PV Company', @source_owner = N'dbo', @source_object = N'PV Company', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'PV Company', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboPV Company]', @del_cmd = N'CALL [sp_MSdel_dboPV Company]', @upd_cmd = N'SCALL [sp_MSupd_dboPV Company]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Company', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Company', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Company', @column = N'Is Shipping Company', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'PV Company', @view_name = N'syncobj_0x3930444444324436', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'PV Object', @source_owner = N'dbo', @source_object = N'PV Object', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'PV Object', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboPV Object]', @del_cmd = N'CALL [sp_MSdel_dboPV Object]', @upd_cmd = N'SCALL [sp_MSupd_dboPV Object]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'Modified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'Version List', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'PV Object', @column = N'Last Modified Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'PV Object', @view_name = N'syncobj_0x4234453639424444', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Record Link', @source_owner = N'dbo', @source_object = N'Record Link', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Record Link', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboRecord Link]', @del_cmd = N'CALL [sp_MSdel_dboRecord Link]', @upd_cmd = N'SCALL [sp_MSupd_dboRecord Link]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Link ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Record ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'URL1', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'URL2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'URL3', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'URL4', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Note', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Created', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Company', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'Notify', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Record Link', @column = N'To User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Record Link', @view_name = N'syncobj_0x3636383933334632', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @source_owner = N'dbo', @source_object = N'Report Layout Selection', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Report Layout Selection', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboReport Layout Selection]', @del_cmd = N'CALL [sp_MSdel_dboReport Layout Selection]', @upd_cmd = N'SCALL [sp_MSupd_dboReport Layout Selection]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @column = N'Report ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @column = N'Custom Report Layout ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Report Layout Selection', @view_name = N'syncobj_0x4543343833393737', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @source_owner = N'dbo', @source_object = N'Report Layout Update Log', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Report Layout Update Log', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboReport Layout Update Log]', @del_cmd = N'CALL [sp_MSdel_dboReport Layout Update Log]', @upd_cmd = N'SCALL [sp_MSupd_dboReport Layout Update Log]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'Status', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'Field Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'Message', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'Report ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'Layout Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @column = N'Layout Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Report Layout Update Log', @view_name = N'syncobj_0x3037433730373642', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @source_owner = N'dbo', @source_object = N'Report List Translation', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Report List Translation', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboReport List Translation]', @del_cmd = N'CALL [sp_MSdel_dboReport List Translation]', @upd_cmd = N'SCALL [sp_MSupd_dboReport List Translation]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @column = N'Menu ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @column = N'Line No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @column = N'Language ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Report List Translation', @view_name = N'syncobj_0x3644374246344539', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @source_owner = N'dbo', @source_object = N'RMA_Track', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'RMA_Track', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboRMA_Track]', @del_cmd = N'CALL [sp_MSdel_dboRMA_Track]', @upd_cmd = N'SCALL [sp_MSupd_dboRMA_Track]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'rowid', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'Activity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'When', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'UserName', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'HostName', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'ApplicationName', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'RMA_DocNo', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @column = N'TableName', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'RMA_Track', @view_name = N'syncobj_0x4444353535414333', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @source_owner = N'dbo', @source_object = N'Send-To Program', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Send-To Program', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboSend-To Program]', @del_cmd = N'CALL [sp_MSdel_dboSend-To Program]', @upd_cmd = N'SCALL [sp_MSupd_dboSend-To Program]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @column = N'Program ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @column = N'Executable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @column = N'Parameter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Send-To Program', @view_name = N'syncobj_0x3834454143454431', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Server Instance', @source_owner = N'dbo', @source_object = N'Server Instance', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'manual', @destination_table = N'Server Instance', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboServer Instance]', @del_cmd = N'CALL [sp_MSdel_dboServer Instance]', @upd_cmd = N'SCALL [sp_MSupd_dboServer Instance]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Server Instance ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Service Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Server Computer Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Last Active', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Server Instance Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Server Port', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Management Port', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Server Instance', @column = N'Status', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Server Instance', @view_name = N'syncobj_0x3346383733383045', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Session Event', @source_owner = N'dbo', @source_object = N'Session Event', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Session Event', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboSession Event]', @del_cmd = N'CALL [sp_MSdel_dboSession Event]', @upd_cmd = N'SCALL [sp_MSupd_dboSession Event]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'User SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Server Instance ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Session ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Event Datetime', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Event Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Client Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Database Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Client Computer Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Comment', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Session Event', @column = N'Session Unique ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Session Event', @view_name = N'syncobj_0x3237433239363544', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @source_owner = N'dbo', @source_object = N'Style Sheet', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Style Sheet', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboStyle Sheet]', @del_cmd = N'CALL [sp_MSdel_dboStyle Sheet]', @upd_cmd = N'SCALL [sp_MSupd_dboStyle Sheet]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Style Sheet ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Program ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Style Sheet', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @column = N'Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Style Sheet', @view_name = N'syncobj_0x4243453733373930', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @source_owner = N'dbo', @source_object = N'Tenant Permission', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Tenant Permission', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboTenant Permission]', @del_cmd = N'CALL [sp_MSdel_dboTenant Permission]', @upd_cmd = N'SCALL [sp_MSupd_dboTenant Permission]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Read Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Insert Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Modify Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Delete Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Execute Permission', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @column = N'Security Filter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Tenant Permission', @view_name = N'syncobj_0x3544414246424541', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Tenant Permission Set', @source_owner = N'dbo', @source_object = N'Tenant Permission Set', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Tenant Permission Set', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboTenant Permission Set]', @del_cmd = N'CALL [sp_MSdel_dboTenant Permission Set]', @upd_cmd = N'SCALL [sp_MSupd_dboTenant Permission Set]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission Set', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission Set', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission Set', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Tenant Permission Set', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Tenant Permission Set', @view_name = N'syncobj_0x4432454233363839', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User', @source_owner = N'dbo', @source_object = N'User', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser]', @del_cmd = N'CALL [sp_MSdel_dboUser]', @upd_cmd = N'SCALL [sp_MSupd_dboUser]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'User Security ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'User Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'Full Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'State', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'Expiry Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'Windows Security ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'Change Password', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'License Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'Authentication Email', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User', @column = N'Contact Email', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User', @view_name = N'syncobj_0x3643423943303841', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @source_owner = N'dbo', @source_object = N'User Default Style Sheet', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Default Style Sheet', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Default Style Sheet]', @del_cmd = N'CALL [sp_MSdel_dboUser Default Style Sheet]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Default Style Sheet]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @column = N'User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @column = N'Program ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @column = N'Style Sheet ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Default Style Sheet', @view_name = N'syncobj_0x3845383246323832', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Group', @source_owner = N'dbo', @source_object = N'User Group', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Group', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Group]', @del_cmd = N'CALL [sp_MSdel_dboUser Group]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Group]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group', @column = N'Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Group', @view_name = N'syncobj_0x4637453536444134', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @source_owner = N'dbo', @source_object = N'User Group Access Control', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Group Access Control', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Group Access Control]', @del_cmd = N'CALL [sp_MSdel_dboUser Group Access Control]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Group Access Control]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'User Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'User Security ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'Scope', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Group Access Control', @view_name = N'syncobj_0x3846323043374632', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Group Member', @source_owner = N'dbo', @source_object = N'User Group Member', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Group Member', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Group Member]', @del_cmd = N'CALL [sp_MSdel_dboUser Group Member]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Group Member]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Member', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Member', @column = N'User Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Member', @column = N'User Security ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Member', @column = N'Company Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Group Member', @view_name = N'syncobj_0x4638374332334339', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @source_owner = N'dbo', @source_object = N'User Group Permission Set', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Group Permission Set', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Group Permission Set]', @del_cmd = N'CALL [sp_MSdel_dboUser Group Permission Set]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Group Permission Set]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @column = N'User Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @column = N'Role ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @column = N'Scope', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @column = N'App ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Group Permission Set', @view_name = N'syncobj_0x3842383238424231', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Metadata', @source_owner = N'dbo', @source_object = N'User Metadata', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Metadata', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Metadata]', @del_cmd = N'CALL [sp_MSdel_dboUser Metadata]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Metadata]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'User SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'Page ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'Personalization ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Metadata', @column = N'Page Metadata Delta', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Metadata', @view_name = N'syncobj_0x3443303845464434', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Personalization', @source_owner = N'dbo', @source_object = N'User Personalization', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Personalization', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Personalization]', @del_cmd = N'CALL [sp_MSdel_dboUser Personalization]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Personalization]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'User SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Profile ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Language ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Company', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Debugger Break On Error', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Debugger Break On Rec Changes', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Debugger Skip System Triggers', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Locale ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Personalization', @column = N'Time Zone', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Personalization', @view_name = N'syncobj_0x4132463636384530', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'User Property', @source_owner = N'dbo', @source_object = N'User Property', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'User Property', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboUser Property]', @del_cmd = N'CALL [sp_MSdel_dboUser Property]', @upd_cmd = N'SCALL [sp_MSupd_dboUser Property]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'User Security ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'Password', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'Name Identifier', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'Authentication Key', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'WebServices Key', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'WebServices Key Expiry Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'User Property', @column = N'Authentication Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'User Property', @view_name = N'syncobj_0x3239314539334234', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_OTHER]
exec sp_addarticle @publication = N'Others_PVDBS27P', @article = N'Web Service', @source_owner = N'dbo', @source_object = N'Web Service', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'Web Service', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboWeb Service]', @del_cmd = N'CALL [sp_MSdel_dboWeb Service]', @upd_cmd = N'SCALL [sp_MSupd_dboWeb Service]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Web Service', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Web Service', @column = N'Object Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Web Service', @column = N'Service Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Web Service', @column = N'Object ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'Others_PVDBS27P', @article = N'Web Service', @column = N'Published', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'Others_PVDBS27P', @article = N'Web Service', @view_name = N'syncobj_0x3034443638383843', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO

-- Adding the transactional subscriptions
use [NAVII_OTHER]
exec sp_addsubscription @publication = N'Others_PVDBS27P', @subscriber = N'PVD37P', @destination_db = N'NAVII_OTHER', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'Others_PVDBS27P', @subscriber = N'PVD37P', @subscriber_db = N'NAVII_OTHER', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

