CREATE TABLE [ods].[SGDW_DimGates]
(
[dgtLocalId] [int] NOT NULL,
[dgtHolderCompanyId] [int] NOT NULL,
[dgtIssuerCompanyId] [int] NULL,
[dgtGuid] [uniqueidentifier] NOT NULL,
[dgtExternalReference] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtPrintedName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dgtHallGuid] [uniqueidentifier] NULL,
[dgtHallVersionGuid] [uniqueidentifier] NULL,
[dgtParentRecordGuid] [uniqueidentifier] NULL,
[dgtIsActive] [bit] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimGates] ON [ods].[SGDW_DimGates]
GO
