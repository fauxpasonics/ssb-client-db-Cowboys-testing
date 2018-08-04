CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimInvoices]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimInvoices] ADD CONSTRAINT [PK__Sync_tem__19364FD29B478F1B] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
