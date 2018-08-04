CREATE TABLE [ods].[SGDW_DimItemTypes]
(
[ditLocalId] [int] NOT NULL,
[ditGuid] [uniqueidentifier] NOT NULL,
[ditHolderCompanyId] [int] NOT NULL,
[ditNumber] [int] NULL,
[ditName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ditDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimItemTypes] ON [ods].[SGDW_DimItemTypes]
GO
