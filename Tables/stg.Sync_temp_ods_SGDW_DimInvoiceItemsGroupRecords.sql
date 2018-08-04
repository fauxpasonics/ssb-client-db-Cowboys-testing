CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimInvoiceItemsGroupRecords]
(
[diigrLocalId] [int] NOT NULL,
[diigrHolderCompanyId] [int] NOT NULL,
[diigrId] [uniqueidentifier] NOT NULL,
[diigrInvoiceId] [uniqueidentifier] NULL,
[diigrDetails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diigrTotalAmount] [money] NULL,
[diigrAmountPerItem] [money] NULL,
[diigrItemType] [int] NULL,
[diigrTotalInsideCommissionAmount] [money] NULL,
[diigrTotalVatAmount] [money] NULL,
[diigrTransactionId] [uniqueidentifier] NULL,
[diigrQuantity] [int] NULL,
[diigrTotalAmountNeto] [money] NULL,
[diigrTotalInsuranceAmount] [money] NULL,
[diigrPriceTypeDetails] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diigrTransactionNumber] [int] NULL,
[diigrArea] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diigrHall] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diigrSector] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diigrRowName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[diigrSeats] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimInvoiceItemsGroupRecords] ADD CONSTRAINT [PK__Sync_tem__19364FD2F19120F8] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
