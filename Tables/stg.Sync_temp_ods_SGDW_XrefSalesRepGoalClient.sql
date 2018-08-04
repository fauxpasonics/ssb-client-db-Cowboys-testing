CREATE TABLE [stg].[Sync_temp_ods_SGDW_XrefSalesRepGoalClient]
(
[xsgcLocalId] [int] NOT NULL,
[xsgcHolderCompanyId] [int] NOT NULL,
[xsgcGuid] [uniqueidentifier] NOT NULL,
[xsgcClientGuid] [uniqueidentifier] NOT NULL,
[xsgcSalesRepGoalGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_XrefSalesRepGoalClient] ADD CONSTRAINT [PK__Sync_tem__19364FD279529782] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
