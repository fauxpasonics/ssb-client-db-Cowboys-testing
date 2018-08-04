CREATE TABLE [ods].[SGDW_DimInvoices]
(
[dinvLocalId] [int] NOT NULL,
[dinvId] [uniqueidentifier] NOT NULL,
[dinvHolderCompanyId] [int] NOT NULL,
[dinvDocumentTypeEnum] [int] NULL,
[dinvGlobalNumber] [int] NULL,
[dinvClientId] [uniqueidentifier] NULL,
[dinvTotalAmount] [money] NULL,
[dinvPaidAmount] [money] NULL,
[dinvTotalVatAmount] [money] NULL,
[dinvTotalInsideCommissionAmount] [money] NULL,
[dinvRemark] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dinvIsFinal] [bit] NULL,
[dinvPayDate] [datetime] NULL,
[dinvCreationDateTime] [datetime] NULL,
[dinvPrintedDateTime] [datetime] NULL,
[dinvCreationAuditId] [bigint] NULL,
[dinvIsPrinted] [bit] NULL,
[dinvTotalAmountNeto] [money] NULL,
[dinvTotalInsuranceAmount] [money] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimInvoices] ON [ods].[SGDW_DimInvoices]
GO
