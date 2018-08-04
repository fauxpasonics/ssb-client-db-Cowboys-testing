CREATE TABLE [ods].[SGDW_DimTitles]
(
[dttlLocalId] [int] NOT NULL,
[dttlGuid] [uniqueidentifier] NOT NULL,
[dttlHolderCompanyId] [int] NOT NULL,
[dttlIssuerCompanyId] [int] NOT NULL,
[dttlGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dttlIsActive] [bit] NOT NULL,
[dttlTypeEnum] [int] NOT NULL,
[dttlOrganizationUnitId] [uniqueidentifier] NULL,
[dttlVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimTitles] ON [ods].[SGDW_DimTitles]
GO
