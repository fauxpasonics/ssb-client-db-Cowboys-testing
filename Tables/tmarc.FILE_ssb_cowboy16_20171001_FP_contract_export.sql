CREATE TABLE [tmarc].[FILE_ssb_cowboy16_20171001_FP_contract_export]
(
[contract_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[date_offered] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[date_signed] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[date_countersigned] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[end_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[term] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy16_20171001_FP_contract_export] ON [tmarc].[FILE_ssb_cowboy16_20171001_FP_contract_export]
GO
