CREATE TABLE [ods].[SGDW_FactProductItemPayments]
(
[fpipLocalId] [int] NOT NULL,
[fpipGUID] [uniqueidentifier] NOT NULL,
[fpipHolderCompanyId] [int] NOT NULL,
[fpipRecordTypeEnum] [int] NULL,
[fpipItemTypeNumber] [int] NULL,
[fpipItemProductId] [uniqueidentifier] NULL,
[fpipItemTotalAmountToPay] [money] NULL,
[fpipItemTotalCommissionToPay] [money] NULL,
[fpipItemTotalTaxToPay] [money] NULL,
[fpipSellTransactionGuid] [uniqueidentifier] NULL,
[fpipSellItemIdInTransaction] [int] NULL,
[fpipTransactionId] [int] NULL,
[fpipTransactionGuid] [uniqueidentifier] NULL,
[fpipItemIdInTransaction] [int] NULL,
[fpipItemGuid] [uniqueidentifier] NULL,
[fpipTransactionDate] [datetime] NULL,
[fpipPaymentTransactionId] [int] NULL,
[fpipPaymentTransactionGuid] [uniqueidentifier] NULL,
[fpipPaymentItemIdInTransaction] [int] NULL,
[fpipPaymentItemGuid] [uniqueidentifier] NULL,
[fpipPaymentAmount] [money] NULL,
[fpipDueAmount] [money] NULL,
[fpipDeductedAmount] [money] NULL,
[fpipPaymentCommissionAmount] [money] NULL,
[fpipPaymentTaxAmount] [money] NULL,
[fpipPaymentDate] [datetime] NULL,
[fpipIsPayCommitment] [bit] NULL,
[fpipIsPayCommitmentExecution] [bit] NULL,
[fpipExecutionOfLineId] [uniqueidentifier] NULL,
[fpipDeductedFromLineId] [uniqueidentifier] NULL,
[fpipExecutedByDeductionId] [uniqueidentifier] NULL,
[fpipSource] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_FactProductItemPayments] ON [ods].[SGDW_FactProductItemPayments]
GO
