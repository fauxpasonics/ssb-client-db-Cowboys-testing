CREATE TABLE [src].[Listrak_MessageAnalyticsInformation]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleAnalyticsCampaignContent] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleAnalyticsCampaignName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsCampaignName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsModuleName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsVersion] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MsgID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
