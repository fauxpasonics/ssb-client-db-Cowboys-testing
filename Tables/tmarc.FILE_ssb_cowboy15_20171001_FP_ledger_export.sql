CREATE TABLE [tmarc].[FILE_ssb_cowboy15_20171001_FP_ledger_export]
(
[ledger_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ledger_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ledger_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gl_code_payment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gl_code_refund] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sort_seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy15_20171001_FP_ledger_export] ON [tmarc].[FILE_ssb_cowboy15_20171001_FP_ledger_export]
GO
