CREATE TABLE [src].[Listrak_ReportSubscribedContacts]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionMethod] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
