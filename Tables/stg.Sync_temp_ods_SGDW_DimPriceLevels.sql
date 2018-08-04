CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceLevels]
(
[dplLocalId] [int] NOT NULL,
[dplHolderCompanyId] [int] NOT NULL,
[dplIssuerCompanyId] [int] NOT NULL,
[dplGuid] [uniqueidentifier] NOT NULL,
[dplName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dplOrganizationUnitGuid] [uniqueidentifier] NULL,
[dplVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceLevels] ADD CONSTRAINT [PK__Sync_tem__19364FD23AE95630] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
