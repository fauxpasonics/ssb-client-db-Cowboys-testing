CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceListPriceTypes]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceListPriceTypes] ADD CONSTRAINT [PK__Sync_tem__19364FD2792F04BB] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
