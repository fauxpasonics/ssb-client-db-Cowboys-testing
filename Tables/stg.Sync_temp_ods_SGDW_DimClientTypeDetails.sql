CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimClientTypeDetails]
(
[dctdLocalId] [int] NOT NULL,
[dctdGuid] [uniqueidentifier] NOT NULL,
[dctdHolderCompanyId] [int] NOT NULL,
[dctdIssuerCompanyId] [int] NULL,
[dctdClientGuid] [uniqueidentifier] NOT NULL,
[dctdTypeGuid] [uniqueidentifier] NOT NULL,
[dctdValidFromDate] [datetime] NULL,
[dctdValidToDate] [datetime] NULL,
[dctdIsDynamic] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimClientTypeDetails] ADD CONSTRAINT [PK__Sync_tem__19364FD26FDE65B3] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
