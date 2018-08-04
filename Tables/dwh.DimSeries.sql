CREATE TABLE [dwh].[DimSeries]
(
[dsrLocalId] [int] NOT NULL,
[dsrGuid] [uniqueidentifier] NOT NULL,
[dsrHolderCompanyId] [int] NOT NULL,
[dsrIssuerCompanyId] [int] NULL,
[dsrCreateDate] [datetime] NULL,
[dsrName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dsrDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsrSchemeGuid] [uniqueidentifier] NULL,
[dsrQuantityOfEvents] [int] NOT NULL,
[dsrMinQuantityOfEvents] [int] NULL,
[dsrHallGuid] [uniqueidentifier] NULL,
[dsrHallVersionGuid] [uniqueidentifier] NULL,
[dsrSeasonalityType] [int] NOT NULL,
[dsrMasterSeriesGuid] [uniqueidentifier] NULL,
[dsrSeasonGuid] [uniqueidentifier] NULL,
[dsrRelatedSeriesGuid] [uniqueidentifier] NULL,
[dsrStartDate] [datetime] NULL,
[dsrEndDate] [datetime] NULL,
[dsrOrganizationUnitGuid] [uniqueidentifier] NULL,
[dsrAclSchemeId] [int] NULL,
[dsrLedgerGuid] [uniqueidentifier] NULL,
[dsrProjectIdentifierGuid] [uniqueidentifier] NULL,
[dsrIsActive] [bit] NOT NULL,
[dsrIsSeated] [bit] NULL,
[dsrOwnerGuid] [uniqueidentifier] NULL,
[dsrOrganizerGuid] [uniqueidentifier] NULL,
[dsrVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dwh].[DimSeries] ADD CONSTRAINT [pk_DimSeries_c_LocalId#HolderCompanyId] PRIMARY KEY CLUSTERED  ([dsrLocalId], [dsrHolderCompanyId])
GO
CREATE NONCLUSTERED INDEX [IX_DimSeries_dsrGuid_dsrHolderCompanyId] ON [dwh].[DimSeries] ([dsrGuid], [dsrHolderCompanyId])
GO
