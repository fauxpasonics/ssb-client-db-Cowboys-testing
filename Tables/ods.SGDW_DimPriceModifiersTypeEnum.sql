CREATE TABLE [ods].[SGDW_DimPriceModifiersTypeEnum]
(
[dpmteLocalId] [int] NOT NULL,
[dpmteGuid] [uniqueidentifier] NOT NULL,
[dpmteEnumValue] [int] NOT NULL,
[dpmteDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceModifiersTypeEnum] ON [ods].[SGDW_DimPriceModifiersTypeEnum]
GO
