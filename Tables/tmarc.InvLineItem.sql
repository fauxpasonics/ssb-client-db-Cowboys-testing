CREATE TABLE [tmarc].[InvLineItem]
(
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item_seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[purchase_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gross_invoice_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[required_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[opt_out] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[opt_out_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[opt_out_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArcYear] [int] NULL,
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[InvLineItem] ADD CONSTRAINT [PK__InvLineI__C4EA24454DCB6492] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
