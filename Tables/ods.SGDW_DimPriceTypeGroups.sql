CREATE TABLE [ods].[SGDW_DimPriceTypeGroups]
(
[dptgLocalId] [int] NOT NULL,
[dptgIssuerCompanyId] [int] NULL,
[dptgHolderCompanyId] [int] NOT NULL,
[dptgName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dptgOrdinal] [int] NULL,
[dptgGuid] [uniqueidentifier] NULL,
[dptgOrganizationUnitId] [uniqueidentifier] NULL,
[dptgShowInPrimaryPanel] [bit] NULL,
[dptgIsActive] [bit] NULL,
[dptgAclSchemeId] [int] NULL,
[dptgVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceTypeGroups] ON [ods].[SGDW_DimPriceTypeGroups]
GO
