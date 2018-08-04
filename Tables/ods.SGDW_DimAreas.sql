CREATE TABLE [ods].[SGDW_DimAreas]
(
[daLocalId] [int] NOT NULL,
[daHolderCompanyId] [int] NOT NULL,
[daIssuerCompanyId] [int] NOT NULL,
[daGuid] [uniqueidentifier] NOT NULL,
[daName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[daHallGuid] [uniqueidentifier] NULL,
[daStandGuid] [uniqueidentifier] NULL,
[daExternalReference] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[daDefaultOrdinal] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimAreas] ON [ods].[SGDW_DimAreas]
GO
