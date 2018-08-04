CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimStands]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimStands] ADD CONSTRAINT [PK__Sync_tem__19364FD278A35C0F] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
