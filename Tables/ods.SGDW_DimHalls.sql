CREATE TABLE [ods].[SGDW_DimHalls]
(
[dhLocalId] [int] NOT NULL,
[dhHolderCompanyId] [int] NOT NULL,
[dhIssuerCompanyId] [int] NOT NULL,
[dhGuid] [uniqueidentifier] NOT NULL,
[dhName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dhVenueGuid] [uniqueidentifier] NULL,
[dhIsActive] [bit] NULL,
[dhOrganizationUnitGuid] [uniqueidentifier] NULL,
[dhAclSchemeId] [int] NULL,
[dhVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimHalls] ON [ods].[SGDW_DimHalls]
GO
