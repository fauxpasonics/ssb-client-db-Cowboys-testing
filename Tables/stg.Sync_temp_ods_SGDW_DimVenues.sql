CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimVenues]
(
[dvLocalId] [int] NOT NULL,
[dvHolderCompanyId] [int] NOT NULL,
[dvIssuerCompanyId] [int] NOT NULL,
[dvGuid] [uniqueidentifier] NOT NULL,
[dvName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dvOrganizationUnitGuid] [uniqueidentifier] NULL,
[dvAclSchemeId] [int] NULL,
[dvGlobalUrl] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dvExternalReference] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dvTimeZoneId] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dvAccessControlSystemGuid] [uniqueidentifier] NULL,
[dvVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimVenues] ADD CONSTRAINT [PK__Sync_tem__19364FD2B869B3A5] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
