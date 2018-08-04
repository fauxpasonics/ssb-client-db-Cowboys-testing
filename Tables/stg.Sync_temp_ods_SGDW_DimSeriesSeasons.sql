CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSeriesSeasons]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSeriesSeasons] ADD CONSTRAINT [PK__Sync_tem__19364FD24B3129B1] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
