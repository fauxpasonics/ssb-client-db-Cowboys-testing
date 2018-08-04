CREATE TABLE [ods].[SGDW_DimStands]
(
[dstLocalId] [int] NOT NULL,
[dstHolderCompanyId] [int] NOT NULL,
[dstIssuerCompanyId] [int] NULL,
[dstGuid] [uniqueidentifier] NOT NULL,
[dstExternalReference] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dstPrintedName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dstDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dstHallGuid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimStands] ON [ods].[SGDW_DimStands]
GO
