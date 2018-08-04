CREATE TABLE [tmarc].[FILE_ssb_cowboy16_20171001_FP_payment_schedule_mop_export]
(
[payment_Schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_plan_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_percentage] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_mask] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_exp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy16_20171001_FP_payment_schedule_mop_export] ON [tmarc].[FILE_ssb_cowboy16_20171001_FP_payment_schedule_mop_export]
GO
