CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimBarcodes]
(
[dbcLocalId] [int] NOT NULL,
[dbcGuid] [uniqueidentifier] NOT NULL,
[dbcHolderCompanyId] [int] NOT NULL,
[dbcReferencedEntityName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dbcReferencedEntityGuid] [uniqueidentifier] NULL,
[dbcBarcode] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dbcEventGuid] [uniqueidentifier] NULL,
[dbcAccessControlSystemGuid] [uniqueidentifier] NOT NULL,
[dbcClientGuid] [uniqueidentifier] NULL,
[dbcCreationDate] [datetime] NULL,
[dbcCancelDate] [datetime] NULL,
[dbcCancelReason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dbcXmlContainer] [xml] NULL,
[dbcScannedEntriesCount] [int] NULL,
[dbcIsActive] [bit] NULL,
[dbcIsVirtual] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimBarcodes] ADD CONSTRAINT [PK__Sync_tem__19364FD26F171450] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
