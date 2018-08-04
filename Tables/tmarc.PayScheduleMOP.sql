CREATE TABLE [tmarc].[PayScheduleMOP]
(
[payment_Schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_plan_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_percentage] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_mask] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cc_exp] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArcYear] [int] NULL,
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[PayScheduleMOP] ADD CONSTRAINT [PK__PaySched__C4EA2445B3A464B4] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
