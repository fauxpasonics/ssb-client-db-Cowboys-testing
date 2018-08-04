CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimCouponUsage]
(
[dcuLocalId] [int] NOT NULL,
[dcuHolderCompanyId] [int] NOT NULL,
[dcuGuid] [uniqueidentifier] NOT NULL,
[dcuPaymentItemGuid] [uniqueidentifier] NOT NULL,
[dcuCouponGuid] [uniqueidentifier] NOT NULL,
[dcuRedemptionCount] [int] NOT NULL,
[dcuRedemptionDate] [datetime] NOT NULL,
[dcuCouponDefinitionGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimCouponUsage] ADD CONSTRAINT [PK__Sync_tem__19364FD2920316DB] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
