CREATE TABLE [ods].[SGDW_DimTurnstiles]
(
[dtsLocalId] [int] NOT NULL,
[dtsGuid] [uniqueidentifier] NOT NULL,
[dtsHolderCompanyId] [int] NOT NULL,
[dtsIssuerCompanyId] [int] NULL,
[dtsName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtsPrintedName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtsDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtsHallGuid] [uniqueidentifier] NULL,
[dtsHallVersionGuid] [uniqueidentifier] NULL,
[dtsParentRecordGuid] [uniqueidentifier] NULL,
[dtsIsActive] [bit] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimTurnstiles] ON [ods].[SGDW_DimTurnstiles]
GO
