CREATE TABLE [stg].[Listrak_ContactListCollection]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Listrak_C__ETL____5E74FADA] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Listrak_C__IsLoa__0DB9F9A8] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
