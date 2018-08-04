CREATE TABLE [src].[Listrak_ReportRangeMessageContactBounces]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceReason] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceDetail] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
