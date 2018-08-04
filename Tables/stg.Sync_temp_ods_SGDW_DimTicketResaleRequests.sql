CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimTicketResaleRequests]
(
[trrLocalId] [int] NOT NULL,
[trrHolderCompanyId] [int] NOT NULL,
[trrGuid] [uniqueidentifier] NOT NULL,
[trrIssuerCompanyId] [int] NOT NULL,
[trrRequestDate] [datetime] NOT NULL,
[trrTicketGuid] [uniqueidentifier] NOT NULL,
[trrNewTicketGuid] [uniqueidentifier] NULL,
[trrStatusEnum] [int] NOT NULL,
[trrStatusDetails] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[trrClientGuid] [uniqueidentifier] NOT NULL,
[trrPaymentMethodGuid] [uniqueidentifier] NULL,
[trrPaymentTokenGuid] [uniqueidentifier] NULL,
[trrRefundDate] [datetime] NULL,
[trrRefundAmount] [money] NULL,
[trrOriginalVersionGuid] [uniqueidentifier] NULL,
[trrNewVersionGuid] [uniqueidentifier] NULL,
[trrResaleMethodEnum] [int] NULL,
[trrExternalOriginator] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[trrRequestedPrice] [money] NULL,
[trrResaleFee] [money] NULL,
[trrRefundReferenceNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimTicketResaleRequests] ADD CONSTRAINT [PK__Sync_tem__19364FD2F7E230F4] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
