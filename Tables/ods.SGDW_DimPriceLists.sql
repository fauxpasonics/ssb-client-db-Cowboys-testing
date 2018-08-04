CREATE TABLE [ods].[SGDW_DimPriceLists]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceLists] ON [ods].[SGDW_DimPriceLists]
GO
