CREATE TABLE [ods].[SGDW_DimVenues]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimVenues] ON [ods].[SGDW_DimVenues]
GO
