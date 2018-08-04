CREATE TABLE [ods].[SGDW_DimCouponUsage]
(
[dcuLocalId] [int] NOT NULL,
[dcuHolderCompanyId] [int] NOT NULL,
[dcuGuid] [uniqueidentifier] NOT NULL,
[dcuPaymentItemGuid] [uniqueidentifier] NOT NULL,
[dcuCouponGuid] [uniqueidentifier] NOT NULL,
[dcuRedemptionCount] [int] NOT NULL,
[dcuRedemptionDate] [datetime] NOT NULL,
[dcuCouponDefinitionGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimCouponUsage] ON [ods].[SGDW_DimCouponUsage]
GO
