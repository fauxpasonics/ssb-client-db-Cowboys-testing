CREATE TABLE [ods].[SGDW_DimSeriesSeasons]
(
[dssLocalId] [int] NOT NULL,
[dssGuid] [uniqueidentifier] NOT NULL,
[dssHolderCompanyId] [int] NOT NULL,
[dssIssuerCompanyId] [int] NULL,
[dssName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dssPreviousSeasonGuid] [uniqueidentifier] NULL,
[dssStartDate] [datetime] NULL,
[dssEndDate] [datetime] NULL,
[dssOrganizationUnitGuid] [uniqueidentifier] NULL,
[dssAclSchemeId] [int] NULL,
[dssIsActive] [bit] NOT NULL,
[dssHoldSeatsForRenewStatus] [int] NULL,
[dssVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSeriesSeasons] ON [ods].[SGDW_DimSeriesSeasons]
GO
