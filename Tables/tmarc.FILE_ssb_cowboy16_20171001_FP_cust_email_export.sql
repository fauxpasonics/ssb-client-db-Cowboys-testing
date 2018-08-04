CREATE TABLE [tmarc].[FILE_ssb_cowboy16_20171001_FP_cust_email_export]
(
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_type_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primary_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_email_registry] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy16_20171001_FP_cust_email_export] ON [tmarc].[FILE_ssb_cowboy16_20171001_FP_cust_email_export]
GO
