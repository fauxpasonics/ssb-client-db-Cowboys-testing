CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceListPriceLevels]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceListPriceLevels] ADD CONSTRAINT [PK__Sync_tem__19364FD2952FCEFF] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
