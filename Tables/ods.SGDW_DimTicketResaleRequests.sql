CREATE TABLE [ods].[SGDW_DimTicketResaleRequests]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [ods].[SGDW_DimTicketResaleRequests] ADD CONSTRAINT [PK_DimTicketResaleRequests_LocalId#HolderCompanyId] PRIMARY KEY CLUSTERED  ([trrLocalId], [trrHolderCompanyId])
GO
