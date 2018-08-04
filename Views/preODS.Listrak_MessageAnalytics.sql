SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_MessageAnalytics]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[CampaignID]) [CampaignID_K]
	,CONVERT(NVARCHAR(100),[ListID]) [ListID_K]
	,CONVERT(NVARCHAR(100),[MsgID]) [MsgID_K]
	,CONVERT(NVARCHAR(255),[CampaignName]) [CampaignName]
	,CONVERT(NVARCHAR(255),[GoogleAnalyticsCampaignContent]) [GoogleAnalyticsCampaignContent]
	,CONVERT(NVARCHAR(255),[GoogleAnalyticsCampaignName]) [GoogleAnalyticsCampaignName]
	,CONVERT(NVARCHAR(255),[ListrakAnalyticsCampaignName]) [ListrakAnalyticsCampaignName]
	,CONVERT(NVARCHAR(255),[ListrakAnalyticsModuleName]) [ListrakAnalyticsModuleName]
	,CONVERT(NVARCHAR(255),[ListrakAnalyticsVersion]) [ListrakAnalyticsVersion]
	,CONVERT(DATETIME,[SendDate]) [SendDate]
	,CONVERT(NVARCHAR(255),[Subject]) [Subject]
FROM [src].[Listrak_MessageAnalyticsInformation] WITH (NOLOCK)
GO
