CREATE TABLE [ods].[SGDW_DimPriceListPriceTypes]
(
[dplptLocalId] [int] NOT NULL,
[dplptHolderCompanyId] [int] NOT NULL,
[dplptPercentDiscount] [decimal] (18, 0) NULL,
[dplptNominalDiscount] [money] NULL,
[dplptDefaultPrice] [money] NULL,
[dplptIsComputed] [bit] NULL,
[dplptOrdinalPosition] [int] NULL,
[dplptGUID] [uniqueidentifier] NULL,
[dplptPriceListId] [uniqueidentifier] NULL,
[dplptPriceTypeId] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceListPriceTypes] ON [ods].[SGDW_DimPriceListPriceTypes]
GO
