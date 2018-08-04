CREATE TABLE [ods].[SGDW_DimTicketVersions]
(
[dtvLocalId] [int] NOT NULL,
[dtvGuid] [uniqueidentifier] NOT NULL,
[dtvIssuerCompanyId] [int] NOT NULL,
[dtvHolderCompanyId] [int] NOT NULL,
[dtvTicketId] [uniqueidentifier] NOT NULL,
[dtvCreationDate] [datetime] NULL,
[dtvCreationReason] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtvStatusEnum] [int] NULL,
[dtvLastStatusDate] [datetime] NULL,
[dtvPreviousVersionGuid] [uniqueidentifier] NULL,
[dtvOriginatorGuid] [uniqueidentifier] NULL,
[dtvOwnerClientGuid] [uniqueidentifier] NULL,
[dtvNotes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtvTransactionGuid] [uniqueidentifier] NULL,
[dtvIsForResale] [bit] NULL,
[dtvPrintCount] [int] NULL,
[dtvIsPrinting] [bit] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [ods].[SGDW_DimTicketVersions] ADD CONSTRAINT [PK_DimTicketVersions_LocalId#HolderCompanyId] PRIMARY KEY CLUSTERED  ([dtvLocalId], [dtvHolderCompanyId])
GO
