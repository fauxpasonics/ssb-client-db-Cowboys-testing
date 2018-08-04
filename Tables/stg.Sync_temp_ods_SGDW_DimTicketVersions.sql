CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimTicketVersions]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimTicketVersions] ADD CONSTRAINT [PK__Sync_tem__19364FD2C6FA7FD5] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
