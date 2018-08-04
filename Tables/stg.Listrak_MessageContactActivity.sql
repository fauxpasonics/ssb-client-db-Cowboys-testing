CREATE TABLE [stg].[Listrak_MessageContactActivity]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL____338C3383] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Listrak_M__IsLoa__7CC60E7E] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
