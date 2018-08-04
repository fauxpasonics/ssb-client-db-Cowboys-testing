CREATE TABLE [ods].[SGDW_DimPriceLevels]
(
[dplLocalId] [int] NOT NULL,
[dplHolderCompanyId] [int] NOT NULL,
[dplIssuerCompanyId] [int] NOT NULL,
[dplGuid] [uniqueidentifier] NOT NULL,
[dplName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dplOrganizationUnitGuid] [uniqueidentifier] NULL,
[dplVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceLevels] ON [ods].[SGDW_DimPriceLevels]
GO
