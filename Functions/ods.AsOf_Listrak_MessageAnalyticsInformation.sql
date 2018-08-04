SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_MessageAnalyticsInformation] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_MessageAnalyticsInformation] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[CampaignID] [nvarchar](100) NULL,
[ListID] [nvarchar](100) NULL,
[MsgID] [nvarchar](100) NULL,
[CampaignName] [nvarchar](255) NULL,
[GoogleAnalyticsCampaignContent] [nvarchar](255) NULL,
[GoogleAnalyticsCampaignName] [nvarchar](255) NULL,
[ListrakAnalyticsCampaignName] [nvarchar](255) NULL,
[ListrakAnalyticsModuleName] [nvarchar](255) NULL,
[ListrakAnalyticsVersion] [nvarchar](255) NULL,
[SendDate] [datetime] NULL,
[Subject] [nvarchar](255) NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)

AS
BEGIN

DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))

INSERT INTO @Results
SELECT [CampaignID],[ListID],[MsgID],[CampaignName],[GoogleAnalyticsCampaignContent],[GoogleAnalyticsCampaignName],[ListrakAnalyticsCampaignName],[ListrakAnalyticsModuleName],[ListrakAnalyticsVersion],[SendDate],[Subject],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [CampaignID],[ListID],[MsgID],[CampaignName],[GoogleAnalyticsCampaignContent],[GoogleAnalyticsCampaignName],[ListrakAnalyticsCampaignName],[ListrakAnalyticsModuleName],[ListrakAnalyticsVersion],[SendDate],[Subject],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_MessageAnalyticsInformation] t
	UNION ALL
	SELECT [CampaignID],[ListID],[MsgID],[CampaignName],[GoogleAnalyticsCampaignContent],[GoogleAnalyticsCampaignName],[ListrakAnalyticsCampaignName],[ListrakAnalyticsModuleName],[ListrakAnalyticsVersion],[SendDate],[Subject],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_MessageAnalyticsInformation]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
