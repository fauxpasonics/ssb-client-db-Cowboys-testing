CREATE TABLE [stg].[Listrak_MessageAnalyticsInformation]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL____2FBBA29F] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Listrak_M__IsLoa__7BD1EA45] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
