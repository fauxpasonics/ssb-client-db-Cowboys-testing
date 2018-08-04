CREATE TABLE [ods].[SGDW_DimSeriesSchemes]
(
[dscLocalId] [int] NOT NULL,
[dscGuid] [uniqueidentifier] NOT NULL,
[dscHolderCompanyId] [int] NOT NULL,
[dscIssuerCompanyId] [int] NULL,
[dscName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dscDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dscSeasonalityType] [int] NOT NULL,
[dscHallGuid] [uniqueidentifier] NULL,
[dscHallVersionGuid] [uniqueidentifier] NULL,
[dscOrganizationUnitGuid] [uniqueidentifier] NULL,
[dscAclSchemeId] [int] NULL,
[dscLedgerGuid] [uniqueidentifier] NULL,
[dscProjectIdentifierGuid] [uniqueidentifier] NULL,
[dscQuantityOfEvents] [int] NULL,
[dscIsActive] [bit] NOT NULL,
[dscMediaGuid] [uniqueidentifier] NULL,
[dscVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSeriesSchemes] ON [ods].[SGDW_DimSeriesSchemes]
GO
