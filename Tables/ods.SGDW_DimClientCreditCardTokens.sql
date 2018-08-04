CREATE TABLE [ods].[SGDW_DimClientCreditCardTokens]
(
[dccctLocalId] [int] NOT NULL,
[dccctHolderCompanyId] [int] NOT NULL,
[dccctGuid] [uniqueidentifier] NOT NULL,
[dccctClientGuid] [uniqueidentifier] NOT NULL,
[dccctServerTokenId] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dccctCardSuffix] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dccctCardPrefix] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dccctCreditCardCompanyGuid] [uniqueidentifier] NULL,
[dccctProviderCreditCompanyCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dccctProviderCreditCompanyName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dccctExpiryYear] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dccctExpiryMonth] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dccctIsActive] [bit] NOT NULL,
[dccctCreatedDate] [datetime] NOT NULL,
[dccctPaymentMethodGuid] [uniqueidentifier] NOT NULL,
[dccctCardNumberMask] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimClientCreditCardTokens] ON [ods].[SGDW_DimClientCreditCardTokens]
GO
