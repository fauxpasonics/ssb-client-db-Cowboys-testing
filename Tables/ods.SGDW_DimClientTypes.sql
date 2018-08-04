CREATE TABLE [ods].[SGDW_DimClientTypes]
(
[dctLocalId] [int] NOT NULL,
[dctGuid] [uniqueidentifier] NOT NULL,
[dctHolderCompanyId] [int] NOT NULL,
[dctIssuerCompanyId] [int] NULL,
[dctName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dctDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dctOrdinal] [int] NOT NULL,
[dctIsActive] [bit] NOT NULL,
[dctOrganizationUnitId] [uniqueidentifier] NULL,
[dctAclSchemeId] [int] NULL,
[dctVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimClientTypes] ON [ods].[SGDW_DimClientTypes]
GO
