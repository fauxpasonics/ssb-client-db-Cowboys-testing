SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_ReportListMessageActivity] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_ReportListMessageActivity] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[ListID] [nvarchar](100) NULL,
[MessageID] [nvarchar](100) NULL,
[Subject] [nvarchar](500) NULL,
[SendDate] [datetime] NULL,
[DeliverCount] [int] NULL,
[RemoveCount] [int] NULL,
[RemovePercent] [decimal](18, 6) NULL,
[OpenCount] [int] NULL,
[OpenPercent] [decimal](18, 6) NULL,
[ReadCount] [int] NULL,
[ReadPercent] [decimal](18, 6) NULL,
[ClickCount] [int] NULL,
[ClickerCount] [int] NULL,
[RepeatClickerCount] [int] NULL,
[NewClickerCount] [int] NULL,
[ClickerPercent] [decimal](18, 6) NULL,
[OrderTotal] [decimal](18, 6) NULL,
[ConversionCount] [int] NULL,
[AverageOrderValue] [decimal](18, 6) NULL,
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
SELECT [ListID],[MessageID],[Subject],[SendDate],[DeliverCount],[RemoveCount],[RemovePercent],[OpenCount],[OpenPercent],[ReadCount],[ReadPercent],[ClickCount],[ClickerCount],[RepeatClickerCount],[NewClickerCount],[ClickerPercent],[OrderTotal],[ConversionCount],[AverageOrderValue],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [ListID],[MessageID],[Subject],[SendDate],[DeliverCount],[RemoveCount],[RemovePercent],[OpenCount],[OpenPercent],[ReadCount],[ReadPercent],[ClickCount],[ClickerCount],[RepeatClickerCount],[NewClickerCount],[ClickerPercent],[OrderTotal],[ConversionCount],[AverageOrderValue],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_ReportListMessageActivity] t
	UNION ALL
	SELECT [ListID],[MessageID],[Subject],[SendDate],[DeliverCount],[RemoveCount],[RemovePercent],[OpenCount],[OpenPercent],[ReadCount],[ReadPercent],[ClickCount],[ClickerCount],[RepeatClickerCount],[NewClickerCount],[ClickerPercent],[OrderTotal],[ConversionCount],[AverageOrderValue],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_ReportListMessageActivity]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
