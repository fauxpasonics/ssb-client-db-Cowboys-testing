CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceLists]
(
[dplLocalId] [int] NOT NULL,
[dplIssuerCompanyId] [int] NULL,
[dplHolderCompanyId] [int] NOT NULL,
[dplGUID] [uniqueidentifier] NOT NULL,
[dplIsActive] [bit] NULL,
[dplDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dplItemTypeId] [int] NULL,
[dplOrganizationUnitId] [uniqueidentifier] NULL,
[dplBasePriceTypeId] [uniqueidentifier] NULL,
[dplAclSchemeId] [int] NULL,
[dplVisibleBySubordinates] [bit] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceLists] ADD CONSTRAINT [PK__Sync_tem__19364FD262D99E7F] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
