CREATE TABLE [tmarc].[FILE_ssb_cowboy16_20171001_FP_cust_rep_export]
(
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_type_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_name_first] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_name_middle] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_name_title] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_company_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_nick_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_name_last_first_mi] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_full_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_user_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rep_phone_formatted] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy16_20171001_FP_cust_rep_export] ON [tmarc].[FILE_ssb_cowboy16_20171001_FP_cust_rep_export]
GO
