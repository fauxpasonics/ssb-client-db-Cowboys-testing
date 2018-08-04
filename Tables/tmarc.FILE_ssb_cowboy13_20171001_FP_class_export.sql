CREATE TABLE [tmarc].[FILE_ssb_cowboy13_20171001_FP_class_export]
(
[class_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[matrix_char] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[return_class_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KILL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[valid_for_reclass] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dist_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dist_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dist_ett] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ism_class_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[qualifier_state_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[system_class] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[qualifier_template] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy13_20171001_FP_class_export] ON [tmarc].[FILE_ssb_cowboy13_20171001_FP_class_export]
GO
