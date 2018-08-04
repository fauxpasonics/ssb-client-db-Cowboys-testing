CREATE TABLE [src].[Listrak_ContactRest]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NextPageCursor] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_AllData_data_] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailKey] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionState] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscribeDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscribeMethod] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeMethod] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L4_AllData_data_segmentationFieldValues_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SegmentationFieldGroupId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SegmentationFieldId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SegmentationFieldValue] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
