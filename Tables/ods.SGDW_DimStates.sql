CREATE TABLE [ods].[SGDW_DimStates]
(
[dsLocalId] [int] NOT NULL,
[dsGuid] [uniqueidentifier] NOT NULL,
[dsHolderCompanyId] [int] NOT NULL,
[dsIssuerCompanyId] [int] NULL,
[dsName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dsCountryGuid] [uniqueidentifier] NULL,
[dsIsActive] [bit] NOT NULL,
[dsOrganizationUnitGuid] [uniqueidentifier] NULL,
[dsVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimStates] ON [ods].[SGDW_DimStates]
GO
