CREATE TABLE [ods].[SGDW_DimInvoiceItemRecords]
(
[diirLocalId] [int] NOT NULL,
[diirHolderCompanyId] [int] NOT NULL,
[diirId] [uniqueidentifier] NOT NULL,
[diirInvoiceId] [uniqueidentifier] NULL,
[diirServiceSpecificId] [uniqueidentifier] NULL,
[diirTransactionId] [uniqueidentifier] NULL,
[diirItemType] [int] NULL,
[diirDetails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diirItemsGroupId] [uniqueidentifier] NULL,
[diirAmount] [money] NULL,
[diirInsideCommissionAmount] [money] NULL,
[diirVatAmount] [money] NULL,
[diirAmountNeto] [money] NULL,
[diirInsuranceAmount] [money] NULL,
[diirPriceTypeDetails] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diirTransactionNumber] [int] NULL,
[diirArea] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diirHall] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diirSector] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diirRowName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diirSeats] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimInvoiceItemRecords] ON [ods].[SGDW_DimInvoiceItemRecords]
GO
