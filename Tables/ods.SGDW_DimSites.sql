CREATE TABLE [ods].[SGDW_DimSites]
(
[dstLocalId] [int] NOT NULL,
[dstHolderCompanyId] [int] NOT NULL,
[dstIssuerCompanyId] [int] NOT NULL,
[dstSiteGuid] [uniqueidentifier] NOT NULL,
[dstSiteName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dstIsActive] [bit] NULL,
[dstOrganizationUnitGuid] [uniqueidentifier] NULL,
[dstVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSites] ON [ods].[SGDW_DimSites]
GO
