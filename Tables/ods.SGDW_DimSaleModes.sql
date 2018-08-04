CREATE TABLE [ods].[SGDW_DimSaleModes]
(
[dsmLocalId] [int] NOT NULL,
[dsmGuid] [uniqueidentifier] NOT NULL,
[dsmHolderCompanyId] [int] NOT NULL,
[dsmIssuerCompanyId] [int] NULL,
[dsmName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsmDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsmIsActive] [bit] NULL,
[dsmBusinessCategories] [uniqueidentifier] NULL,
[dsmOrganizationUnitGuid] [uniqueidentifier] NULL,
[dsmVisibleBySubordinates] [bit] NOT NULL,
[dsmSaleModeGroupGuid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSaleModes] ON [ods].[SGDW_DimSaleModes]
GO
