CREATE TABLE [tmarc].[FILE_ssb_cowboy14_20171001_FP_payment_schedule_export]
(
[payment_schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_plan_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_plan_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[periods] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_period_paid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[purchase_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paid_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percent_due] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percent_paid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[compliant] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[effective_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[expiration_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_effective_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_expiration_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_plan_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_plan_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_payment_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[period_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy14_20171001_FP_payment_schedule_export] ON [tmarc].[FILE_ssb_cowboy14_20171001_FP_payment_schedule_export]
GO
