CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimInvoiceItemRecords]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimInvoiceItemRecords] ADD CONSTRAINT [PK__Sync_tem__19364FD25839F392] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
