CREATE TABLE [stg].[Listrak_ReportSubscribedContacts]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Listrak_R__ETL____2DF1BF10] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Listrak_R__IsLoa__396371BC] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
