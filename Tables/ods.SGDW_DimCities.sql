CREATE TABLE [ods].[SGDW_DimCities]
(
[dctLocalId] [int] NOT NULL,
[dctId] [uniqueidentifier] NOT NULL,
[dctHolderCompanyId] [int] NOT NULL,
[dctIssuerCompanyId] [int] NULL,
[dctGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dctCountryId] [uniqueidentifier] NULL,
[dctStateId] [uniqueidentifier] NULL,
[dctIsApproved] [bit] NOT NULL,
[dctIsActive] [bit] NOT NULL,
[dctOrganizationUnitGuid] [uniqueidentifier] NULL,
[dctVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimCities] ON [ods].[SGDW_DimCities]
GO
