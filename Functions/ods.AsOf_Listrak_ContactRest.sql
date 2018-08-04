SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_ContactRest] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_ContactRest] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[ListID] [nvarchar](100) NULL,
[EmailAddress] [nvarchar](255) NULL,
[EmailKey] [nvarchar](255) NULL,
[SubscriptionState] [nvarchar](255) NULL,
[SubscribeDate] [datetime2](7) NULL,
[SubscribeMethod] [nvarchar](255) NULL,
[UnsubscribeDate] [datetime] NULL,
[UnsubscribeMethod] [nvarchar](255) NULL,
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
SELECT [ListID],[EmailAddress],[EmailKey],[SubscriptionState],[SubscribeDate],[SubscribeMethod],[UnsubscribeDate],[UnsubscribeMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [ListID],[EmailAddress],[EmailKey],[SubscriptionState],[SubscribeDate],[SubscribeMethod],[UnsubscribeDate],[UnsubscribeMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_ContactRest] t
	UNION ALL
	SELECT [ListID],[EmailAddress],[EmailKey],[SubscriptionState],[SubscribeDate],[SubscribeMethod],[UnsubscribeDate],[UnsubscribeMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_ContactRest]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
