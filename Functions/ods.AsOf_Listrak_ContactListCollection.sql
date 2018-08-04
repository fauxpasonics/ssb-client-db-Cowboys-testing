SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_ContactListCollection] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_ContactListCollection] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[ListID] [nvarchar](255) NULL,
[ListName] [nvarchar](255) NULL,
[CreateDate] [nvarchar](255) NULL,
[FromName] [nvarchar](255) NULL,
[FromEmail] [nvarchar](255) NULL,
[EnableRemovalLink] [nvarchar](50) NULL,
[EnableBrowserLink] [nvarchar](50) NULL,
[bounceHandling] [int] NULL,
[EnableDoubleOptin] [nvarchar](50) NULL,
[EnableListHygiene] [nvarchar](50) NULL,
[ShowEmailList] [nvarchar](50) NULL,
[ShowAdvancedPersonalization] [nvarchar](50) NULL,
[BounceUnsubscribeCount] [int] NULL,
[DomainAliasLink] [nvarchar](255) NULL,
[DomainAliasEmail] [nvarchar](255) NULL,
[EnableRSS] [nvarchar](50) NULL,
[EnableGoogleAnalytics] [nvarchar](50) NULL,
[GoogleTrackingDomains] [nvarchar](500) NULL,
[EnableInternationalization] [nvarchar](50) NULL,
[EnableDynamicContent] [nvarchar](50) NULL,
[EnableListRemoveHeader] [nvarchar](50) NULL,
[VmtaID] [nvarchar](255) NULL,
[VmtaDescription] [nvarchar](255) NULL,
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
SELECT [ListID],[ListName],[CreateDate],[FromName],[FromEmail],[EnableRemovalLink],[EnableBrowserLink],[bounceHandling],[EnableDoubleOptin],[EnableListHygiene],[ShowEmailList],[ShowAdvancedPersonalization],[BounceUnsubscribeCount],[DomainAliasLink],[DomainAliasEmail],[EnableRSS],[EnableGoogleAnalytics],[GoogleTrackingDomains],[EnableInternationalization],[EnableDynamicContent],[EnableListRemoveHeader],[VmtaID],[VmtaDescription],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [ListID],[ListName],[CreateDate],[FromName],[FromEmail],[EnableRemovalLink],[EnableBrowserLink],[bounceHandling],[EnableDoubleOptin],[EnableListHygiene],[ShowEmailList],[ShowAdvancedPersonalization],[BounceUnsubscribeCount],[DomainAliasLink],[DomainAliasEmail],[EnableRSS],[EnableGoogleAnalytics],[GoogleTrackingDomains],[EnableInternationalization],[EnableDynamicContent],[EnableListRemoveHeader],[VmtaID],[VmtaDescription],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_ContactListCollection] t
	UNION ALL
	SELECT [ListID],[ListName],[CreateDate],[FromName],[FromEmail],[EnableRemovalLink],[EnableBrowserLink],[bounceHandling],[EnableDoubleOptin],[EnableListHygiene],[ShowEmailList],[ShowAdvancedPersonalization],[BounceUnsubscribeCount],[DomainAliasLink],[DomainAliasEmail],[EnableRSS],[EnableGoogleAnalytics],[GoogleTrackingDomains],[EnableInternationalization],[EnableDynamicContent],[EnableListRemoveHeader],[VmtaID],[VmtaDescription],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_ContactListCollection]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
