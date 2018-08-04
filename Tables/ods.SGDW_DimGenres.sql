CREATE TABLE [ods].[SGDW_DimGenres]
(
[dgLocalId] [int] NOT NULL,
[dgGuid] [uniqueidentifier] NOT NULL,
[dgHolderCompanyId] [int] NOT NULL,
[dgIssuerCompanyId] [int] NOT NULL,
[dgDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dgAclSchemeId] [int] NULL,
[dgOrganizationUnitGuid] [uniqueidentifier] NULL,
[dgVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimGenres] ON [ods].[SGDW_DimGenres]
GO
