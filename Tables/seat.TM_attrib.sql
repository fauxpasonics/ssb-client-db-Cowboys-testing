CREATE TABLE [seat].[TM_attrib]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [seat].[TM_attrib] ADD CONSTRAINT [PK__FILE__ss__C4EA2445F61B2F1B] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
