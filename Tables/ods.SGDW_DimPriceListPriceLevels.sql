CREATE TABLE [ods].[SGDW_DimPriceListPriceLevels]
(
[dplplLocalId] [int] NOT NULL,
[dplplHolderCompanyId] [int] NOT NULL,
[dplplGUID] [uniqueidentifier] NOT NULL,
[dplplPrice] [money] NULL,
[dplplIsComputed] [bit] NULL,
[dplplOrdinalPosition] [int] NULL,
[dplplIsDisabled] [bit] NULL,
[dplplPriceListPriceTypeId] [uniqueidentifier] NULL,
[dplplPriceLevelId] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceListPriceLevels] ON [ods].[SGDW_DimPriceListPriceLevels]
GO
