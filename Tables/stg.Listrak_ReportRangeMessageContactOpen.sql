CREATE TABLE [stg].[Listrak_ReportRangeMessageContactOpen]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL____12D54B2E] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Listrak_R__IsLoa__1B6A912F] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
