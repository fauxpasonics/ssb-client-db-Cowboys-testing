CREATE TABLE [etl].[Listrak_MessageActivityRest_working]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL,
[ETL__multi_query_value_for_audit] [bigint] NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL,
[ID] [int] NOT NULL,
[ETL_InsertedDate] [datetime] NULL CONSTRAINT [DF__Listrak_M__ETL_I__1AAE06C0] DEFAULT (getdate())
)
GO
