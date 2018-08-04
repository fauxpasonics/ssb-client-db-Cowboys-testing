CREATE TABLE [seat].[TM_arena]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[arena_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[arena_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[arena_abv] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_arena_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [seat].[TM_arena] ADD CONSTRAINT [PK__FILE__ss__C4EA24458FF3CB2F] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
