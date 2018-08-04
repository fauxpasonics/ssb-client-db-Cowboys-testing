CREATE TABLE [stg].[Sync_temp_ods_SGDW_FactPayments]
(
[fpLocalId] [int] NOT NULL,
[fpHolderCompanyId] [int] NOT NULL,
[fpIssuerCompanyId] [int] NULL,
[fpItemGuid] [uniqueidentifier] NOT NULL,
[fpTransactionLocalId] [int] NOT NULL,
[fpIdInTransaction] [int] NOT NULL,
[fpTransactNum] [int] NULL,
[fpTransactGuid] [uniqueidentifier] NULL,
[fpPaymentSessionGuid] [uniqueidentifier] NULL,
[fpPaymentAmount] [money] NULL,
[fpActionSign] [smallint] NULL,
[fpPaymentMethodGuid] [uniqueidentifier] NULL,
[fpShiftGuid] [uniqueidentifier] NULL,
[fpSalePointGuid] [uniqueidentifier] NULL,
[fpUserGuid] [uniqueidentifier] NULL,
[fpTillGuid] [uniqueidentifier] NULL,
[fpClientGuid] [uniqueidentifier] NULL,
[fpRecoAccountGuid] [uniqueidentifier] NULL,
[fpActualDate] [datetime] NULL,
[fpBusinessDate] [datetime] NULL,
[fpPaymentCurrencyCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpCompanyAmount] [money] NULL,
[fpCompanyCurrencyCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpApplicationChannel] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpSaleModeGuid] [uniqueidentifier] NULL,
[fpBusinessCategoryGuid] [uniqueidentifier] NULL,
[fpPaymentType] [int] NULL,
[fpPaymentTypeDescription] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpReferenceNumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpOnBehalfOfAccountGuid] [uniqueidentifier] NULL,
[fpTranrefNum] [bigint] NULL,
[fpBackwardTranrefNum] [bigint] NULL,
[fpStatusEnum] [int] NULL,
[fpPaymentItemGuid] [uniqueidentifier] NULL,
[fpCCSuffix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpCreditCompanyGuid] [uniqueidentifier] NULL,
[fpClearingCompanyGuid] [uniqueidentifier] NULL,
[fpExpirationYear] [int] NULL,
[fpExpirationMonth] [int] NULL,
[fpPaymentsCount] [int] NULL,
[fpVoucherDefinitionGuid] [uniqueidentifier] NULL,
[fpVouchernumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpPersonalId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpMandateGuid] [uniqueidentifier] NULL,
[fpClientAmount] [money] NULL,
[fpAccountNumber] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpAccountName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpCouponGuid] [uniqueidentifier] NULL,
[fpBankCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpBranchCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpChequeNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpChequeValidFrom] [datetime] NULL,
[fpSubsidizingAccountGuid] [uniqueidentifier] NULL,
[fpTotalCommission] [money] NULL,
[fpTotalDiscount] [money] NULL,
[fpRedeemedPoints] [float] NULL,
[fpLoyaltyPointsOwnerGuid] [uniqueidentifier] NULL,
[fpGiftCardProgramGuid] [uniqueidentifier] NULL,
[fpGiftCardTypeGuid] [uniqueidentifier] NULL,
[fpGiftCardNumber] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpSellerGuid] [uniqueidentifier] NULL,
[fpSellerBranchGuid] [uniqueidentifier] NULL,
[fpFirstPayment] [money] NULL,
[fpConstAmount] [money] NULL,
[fpClientCreditItemGuid] [uniqueidentifier] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_FactPayments] ADD CONSTRAINT [PK__Sync_tem__19364FD2C7F7138C] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO