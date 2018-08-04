CREATE TABLE [ods].[SGDW_DimHallVersions]
(
[dhvLocalId] [int] NOT NULL,
[dhvHolderCompanyId] [int] NOT NULL,
[dhvIssuerCompanyId] [int] NOT NULL,
[dhvGuid] [uniqueidentifier] NOT NULL,
[dhvName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dhvHallGuid] [uniqueidentifier] NULL,
[dhvOrganizationUnitGuid] [uniqueidentifier] NULL,
[dhvVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimHallVersions] ON [ods].[SGDW_DimHallVersions]
GO
