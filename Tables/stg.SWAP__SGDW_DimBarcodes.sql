CREATE TABLE [stg].[SWAP__SGDW_DimBarcodes]
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
[dbcScannedEntriesCount] [int] NULL,
[dbcIsActive] [bit] NULL,
[dbcIsVirtual] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimBarcodes] ON [stg].[SWAP__SGDW_DimBarcodes]
GO
