-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'NAVII_00', @optname = N'publish', @value = N'true'
GO

exec [NAVII_00].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [NAVII_00]
exec sp_addpublication @publication = N'00-Master_Inventory_PVDBS20P', @description = N'Transactional publication of database ''NAVII_00'' from Publisher ''PVCO01P-NAV\NAV''.', @sync_method = N'concurrent', @retention = 36, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'00-Master_Inventory_PVDBS20P', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\srvc_sql_pvdbs33p'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\srvc_sql_pvdbs37p'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\SRVC_SQL_PVDBS39P'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\SRVC_SQLSENTRY'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\Local Admin - Database Servers'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\srvc_NAVII_0002'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\srvc_veeam'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\CBTS_GROUP'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\SRVC_SQL_CBTS'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\SRVC_SQL_Distributor'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\dechime'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\gmiladin'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'DOMAIN-A\NAVII_AGP20'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'00-Master_Inventory_PVDBS20P', @login = N'NT SERVICE\MSSQLSERVER'
GO

-- Adding the transactional articles
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @source_owner = N'dbo', @source_object = N'00-Master$Barcodes', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Barcodes', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Barcodes]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Barcodes]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Barcodes]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Barcode No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Show for Item', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Last Date Modified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Variant Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Unit of Measure Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Discount _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Barcodes', @view_name = N'syncobj_0x3041303432413642', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @source_owner = N'dbo', @source_object = N'00-Master$Item', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Item', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Item]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Item]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Item]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'No_ 2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Search Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Description 2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Base Unit of Measure', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Price Unit Conversion', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Inventory Posting Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Shelf No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Disc_ Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Allow Invoice Disc_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Statistics Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Commission Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Unit Price', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Price_Profit Calculation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Profit _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Costing Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Unit Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Standard Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Last Direct Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Indirect Cost _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Cost is Adjusted', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Allow Online Adjustment', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Vendor No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Vendor Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lead Time Calculation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Reorder Point', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Maximum Inventory', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Reorder Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Alternative Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Unit List Price', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Duty Due _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Duty Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Gross Weight', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Net Weight', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Units per Parcel', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Unit Volume', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Durability', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Freight Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Tariff No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Duty Unit Conversion', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Country_Region Purchased Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Budget Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Budgeted Amount', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Budget Profit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Blocked', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Last Date Modified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Price Includes VAT', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'VAT Bus_ Posting Gr_ (Price)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Gen_ Prod_ Posting Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Picture', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Country_Region of Origin Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Automatic Ext_ Texts', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'No_ Series', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Tax Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'VAT Prod_ Posting Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Reserve', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Global Dimension 1 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Global Dimension 2 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Stockout Warning', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Prevent Negative Inventory', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Application Wksh_ User ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Assembly Policy', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'GTIN', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Default Deferral Template Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Low-Level Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lot Size', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Serial Nos_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Last Unit Cost Calc_ Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rolled-up Material Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rolled-up Capacity Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Scrap _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Inventory Value Zero', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Discrete Order Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Minimum Order Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Maximum Order Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Safety Stock Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Order Multiple', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Safety Lead Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Flushing Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replenishment System', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rounding Precision', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Sales Unit of Measure', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Purch_ Unit of Measure', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Time Bucket', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Reordering Policy', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Include Inventory', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Manufacturing Policy', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rescheduling Period', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lot Accumulation Period', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Dampener Period', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Dampener Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Overflow Level', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Manufacturer Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Category Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Created From Nonstock Item', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Product Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Service Item Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Tracking Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lot Nos_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Expiration Calculation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Special Equipment Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Put-away Template Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Put-away Unit of Measure Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Phys Invt Counting Period Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Last Counting Period Update', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Use Cross-Docking', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Next Counting Start Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Next Counting End Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Duty Class', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Date Created', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Created by User', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Division Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Modifying Date of Status', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Last Modified by User', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Error Check Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Error Check Status', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Suggested Qty_ on POS', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Capacity Value', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Qty not in Decimal', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Warranty Card', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Def_ Ordered by', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Def_ Ordering Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Original Vendor No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Original Vendor Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'BOM Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'BOM Receipt Print', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Recipe Version Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Recipe Item Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'BOM Cost Price Distribution', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'BOM Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'BOM Receiving Explode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Depth', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Width', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Height', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'External Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Extern_ Size+Crust', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Variant Framework Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Season Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lifecycle Length', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lifecycle Starting Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Lifecycle Ending Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Error Check Internal Usage', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Attrib 1 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Attrib 2 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Attrib 3 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Attrib 4 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Attrib 5 Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'ABC Sales', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'ABC Profit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Wastage _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Excluded from Portion Weight', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Unaff_ by Multipl_ Factor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Exclude from Menu Requisition', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Recipe No_ of Portions', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Max_ Modifiers No Price', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Max_ Ingr_ Removed No Price', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Max_ Ingr_ + Modifiers', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Production Time (Min_)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Display Ingredients in Monitor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Display Instruct_ in Monitor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Recipe Main Ingredient', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Recipe Style', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Recipe Category', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Available as Dish', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'UOM Pop-up on POS', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replenishment Calculation Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Manual Estimated Daily Sale', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Store Stock Cover Reqd (Days)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Wareh Stock Cover Reqd (Days)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replenishment Sales Profile', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replenishment Grade Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Exclude from Replenishment', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Transfer Multiple', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Store Forward Sales Profile', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Wareh_ Forward Sales Profile', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Purch_ Order Delivery', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replenish as Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Profit Goal _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replen_ Data Profile', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Like for Like Replen_ Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Like for Like Process Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replenish as Item No - Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replen_ Transfer Rule Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Select Lowest Price Vendor', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Effective Inv_ Sales Order', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Effective Inv_ Purchase Ord_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Effective Inv_ Transfer Inb_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Effective Inv_ Transfer Outb_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Confidence Factor Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Fuel Item', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Routing No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Production BOM No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Single-Level Material Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Single-Level Capacity Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Single-Level Subcontrd_ Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Single-Level Cap_ Ovhd Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Single-Level Mfg_ Ovhd Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Overhead Rate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rolled-up Subcontracted Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rolled-up Mfg_ Ovhd Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Rolled-up Cap_ Overhead Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Order Tracking Policy', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Critical', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Item Family Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Unit Price Including VAT', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'POS Cost Calculation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'No Stock Posting', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Zero Price Valid', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Qty_ Becomes Negative', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'No Discount Allowed', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Keying in Price', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Scale Item', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Keying in Quantity', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Skip Compression When Scanned', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Skip Compression When Printed', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Barcode Mask', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Use EAN Standard Barc_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Qty_ per Base Comp_ Unit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Base Comp_ Unit Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Comparison Unit Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Comp_ Price Incl_ VAT', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Explode BOM in Statem_ Posting', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Disable Dispense Printing', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Dispense Printer Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Print Variants Shelf Labels', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'WIC Applicable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Food Stamp Applicable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Ask for Tare', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Default Tare Weight', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Common Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'xWarranty Period', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Similar Item Cofactor _', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Warehouse Min_ Qty', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Orderable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Vendor Stated Shelf Life (Mo_)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Min_ Accept_ Shelf Life (Mo_)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Listing Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Bosley Listing Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Import Allowed US', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Import Allowed CAN', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'NAFTA Applicable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Edible', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Manf_ ID No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'TSCA Applicable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'PKG Tax Liable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Packaging Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Packaging Weight (GR)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Tariff Code (US)', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'FDA Product Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory Address 1', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory Address 2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory City', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory Province', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory Postal Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Factory Country', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Manufacturer FDA', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Category Manager', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'VP Procurement', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Sales Multiplier', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Sales Multiplier St_ Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Sales Multiplier End Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Non LP Expiry Date Req_d', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Whse_ USD Landed Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Whse_ CAD Landed Cost', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Allow Zero Wholesale Prices', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Web Item Group', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Store Order Limit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'PTL', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Merchandise Division', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Department', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Category', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'Sub-Category', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'MDM Number', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item', @view_name = N'syncobj_0x3835443546333836', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @source_owner = N'dbo', @source_object = N'00-Master$Item Exceptions', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Item Exceptions', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Item Exceptions]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Item Exceptions]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Item Exceptions]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Entry Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Group Type', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Value', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Default DMIN', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Exceptions', @view_name = N'syncobj_0x3137434635303830', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @source_owner = N'dbo', @source_object = N'00-Master$Item Store Display Minimum', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Item Store Display Minimum', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Item Store Display Minimum]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Item Store Display Minimum]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Item Store Display Minimum]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'Store Type Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'Store Display Minimum', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'Allowed DMIN Changes', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Store Display Minimum', @view_name = N'syncobj_0x3141424644343831', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @source_owner = N'dbo', @source_object = N'00-Master$Item Unit of Measure', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Item Unit of Measure', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Item Unit of Measure]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Item Unit of Measure]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Item Unit of Measure]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Qty_ per Unit of Measure', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Length', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Width', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Height', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Cubage', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Weight', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'No_ in Barcode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Print Shelf Label', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Text on Shelf Label', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Count as 1 on Receipt', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'POS Selection', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Order', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Item Unit of Measure', @view_name = N'syncobj_0x3437454244374644', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @source_owner = N'dbo', @source_object = N'00-Master$Store Merch Hierarchy Level', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Store Merch Hierarchy Level', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Store Merch Hierarchy Level]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Store Merch Hierarchy Level]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Store Merch Hierarchy Level]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @column = N'Store No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @column = N'Product Group Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @column = N'Store Type Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @column = N'Replication Counter', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Store Merch Hierarchy Level', @view_name = N'syncobj_0x3344434430413133', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [NAVII_00]
exec sp_addarticle @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @source_owner = N'dbo', @source_object = N'00-Master$Web Item Texts', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000448E35EDF, @identityrangemanagementoption = N'none', @destination_table = N'00-Master$Web Item Texts', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dbo00-Master$Web Item Texts]', @del_cmd = N'CALL [sp_MSdel_dbo00-Master$Web Item Texts]', @upd_cmd = N'SCALL [sp_MSupd_dbo00-Master$Web Item Texts]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'timestamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Item No_', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Language', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Web Description', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Ingredients', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Active', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Title', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Guaranteed Analysis', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Feeding Instructions', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Caution', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'Web Dimensions', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @column = N'datasync', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'00-Master_Inventory_PVDBS20P', @article = N'00-Master$Web Item Texts', @view_name = N'syncobj_0x3139383131373132', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO

-- Adding the transactional subscriptions
use [NAVII_00]
exec sp_addsubscription @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVD37P', @destination_db = N'NAVII_00', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVD37P', @subscriber_db = N'NAVII_00', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [NAVII_00]
exec sp_addsubscription @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS24P', @destination_db = N'WorkingMaster', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS24P', @subscriber_db = N'WorkingMaster', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [NAVII_00]
exec sp_addsubscription @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS25P', @destination_db = N'WorkingMaster', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS25P', @subscriber_db = N'WorkingMaster', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [NAVII_00]
exec sp_addsubscription @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS26P', @destination_db = N'WorkingMaster', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS26P', @subscriber_db = N'WorkingMaster', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [NAVII_00]
exec sp_addsubscription @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS27P', @destination_db = N'WorkingMaster', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS27P', @subscriber_db = N'WorkingMaster', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [NAVII_00]
exec sp_addsubscription @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS32P', @destination_db = N'NAVII_00', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'00-Master_Inventory_PVDBS20P', @subscriber = N'PVDBS32P', @subscriber_db = N'NAVII_00', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

