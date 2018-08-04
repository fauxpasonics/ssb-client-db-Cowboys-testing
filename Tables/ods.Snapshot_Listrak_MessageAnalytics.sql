CREATE TABLE [ods].[Snapshot_Listrak_MessageAnalytics]
(
[Listrak_MessageAnalyticsInformationSK] [int] NOT NULL IDENTITY(1, 1),
[CampaignID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MsgID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleAnalyticsCampaignContent] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleAnalyticsCampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsCampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsModuleName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsVersion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime] NULL,
[Subject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_MessageAnalytics] ADD CONSTRAINT [PK__Snapshot__AAA01286A890B906] PRIMARY KEY CLUSTERED  ([Listrak_MessageAnalyticsInformationSK])
GO
