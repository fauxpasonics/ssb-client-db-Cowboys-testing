CREATE TABLE [ods].[SGDW_DimPriceTypes]
(
[dptLocalId] [int] NOT NULL,
[dptHoldercompanyId] [int] NOT NULL,
[dptIssuerCompanyId] [int] NOT NULL,
[dptPriceTypeGUID] [uniqueidentifier] NOT NULL,
[dptPriceTypeName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dptPriceTypeGroupId] [uniqueidentifier] NULL,
[dptOrganizationUnitId] [uniqueidentifier] NULL,
[dptAclSchemeId] [int] NULL,
[dptIsActive] [bit] NULL,
[dptVisibleBySubordinates] [bit] NOT NULL,
[dptShortName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceTypes] ON [ods].[SGDW_DimPriceTypes]
GO
