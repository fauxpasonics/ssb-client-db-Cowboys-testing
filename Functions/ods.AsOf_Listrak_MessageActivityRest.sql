SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_MessageActivityRest] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_MessageActivityRest] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MessageID] [nvarchar](100) NULL,
[Abuse] [nvarchar](50) NULL,
[ActivityDate] [datetime2](7) NULL,
[Bounce] [nvarchar](50) NULL,
[BounceReason] [nvarchar](500) NULL,
[Click] [nvarchar](50) NULL,
[ClickCount] [int] NULL,
[EmailAddress] [nvarchar](500) NULL,
[Open] [nvarchar](50) NULL,
[OrderTotal] [decimal](18, 6) NULL,
[Read] [nvarchar](50) NULL,
[SendDate] [datetime2](7) NULL,
[Unsubscribe] [nvarchar](50) NULL,
[VisitDate] [datetime2](7) NULL,
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
SELECT [MessageID],[Abuse],[ActivityDate],[Bounce],[BounceReason],[Click],[ClickCount],[EmailAddress],[Open],[OrderTotal],[Read],[SendDate],[Unsubscribe],[VisitDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MessageID],[Abuse],[ActivityDate],[Bounce],[BounceReason],[Click],[ClickCount],[EmailAddress],[Open],[OrderTotal],[Read],[SendDate],[Unsubscribe],[VisitDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_MessageActivityRest] t
	UNION ALL
	SELECT [MessageID],[Abuse],[ActivityDate],[Bounce],[BounceReason],[Click],[ClickCount],[EmailAddress],[Open],[OrderTotal],[Read],[SendDate],[Unsubscribe],[VisitDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_MessageActivityRest]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
