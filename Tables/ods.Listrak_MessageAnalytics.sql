CREATE TABLE [ods].[Listrak_MessageAnalytics]
(
[CampaignID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MsgID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleAnalyticsCampaignContent] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GoogleAnalyticsCampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsCampaignName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsModuleName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListrakAnalyticsVersion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime] NULL,
[Subject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL_C__0C08520E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_M__ETL_C__0CFC7647] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Listrak_M__ETL_U__0DF09A80] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Listrak_M__ETL_U__0EE4BEB9] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Listrak_MessageAnalyticsUpdate] ON [ods].[Listrak_MessageAnalytics]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Listrak_MessageAnalytics] t
	JOIN inserted i ON  t.[CampaignID] = i.[CampaignID] AND t.[ListID] = i.[ListID] AND t.[MsgID] = i.[MsgID]

INSERT INTO [ods].[Snapshot_Listrak_MessageAnalytics] ([CampaignID],[ListID],[MsgID],[CampaignName],[GoogleAnalyticsCampaignContent],[GoogleAnalyticsCampaignName],[ListrakAnalyticsCampaignName],[ListrakAnalyticsModuleName],[ListrakAnalyticsVersion],[SendDate],[Subject],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,DATEADD(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Listrak_MessageAnalytics] ADD CONSTRAINT [PK__Listrak___E2009CA7AB70A873] PRIMARY KEY CLUSTERED  ([CampaignID], [ListID], [MsgID])
GO
