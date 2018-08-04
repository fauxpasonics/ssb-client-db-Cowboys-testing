CREATE TABLE [tmarc].[FILE_ssb_cowboy15_20171001_FP_season_export]
(
[season_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[arena_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[manifest_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[season_year] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[org_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc__FILE_ssb_cowboy15_20171001_FP_season_export] ON [tmarc].[FILE_ssb_cowboy15_20171001_FP_season_export]
GO
