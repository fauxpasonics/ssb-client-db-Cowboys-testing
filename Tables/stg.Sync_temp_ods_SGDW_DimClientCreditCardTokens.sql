CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimClientCreditCardTokens]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimClientCreditCardTokens] ADD CONSTRAINT [PK__Sync_tem__19364FD2804376B8] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
