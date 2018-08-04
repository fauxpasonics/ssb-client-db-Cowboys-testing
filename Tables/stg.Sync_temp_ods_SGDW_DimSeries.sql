CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSeries]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSeries] ADD CONSTRAINT [PK__Sync_tem__19364FD23CB2486A] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
