CREATE TABLE [ods].[SGDW_DimAreaMaps]
(
[damLocalId] [int] NOT NULL,
[damHolderCompanyId] [int] NOT NULL,
[damGuid] [uniqueidentifier] NOT NULL,
[damName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[damAreaGuid] [uniqueidentifier] NULL,
[damCapacity] [int] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimAreaMaps] ON [ods].[SGDW_DimAreaMaps]
GO
