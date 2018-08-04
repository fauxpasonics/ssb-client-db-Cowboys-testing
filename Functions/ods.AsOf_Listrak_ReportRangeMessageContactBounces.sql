SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_ReportRangeMessageContactBounces] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_ReportRangeMessageContactBounces] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MessageID] [nvarchar](100) NULL,
[ContactID] [nvarchar](100) NULL,
[EmailAddress] [nvarchar](255) NULL,
[BounceReason] [nvarchar](255) NULL,
[BounceDetail] [nvarchar](255) NULL,
[BounceDate] [datetime] NULL,
[BounceCount] [int] NULL,
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
SELECT [MessageID],[ContactID],[EmailAddress],[BounceReason],[BounceDetail],[BounceDate],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MessageID],[ContactID],[EmailAddress],[BounceReason],[BounceDetail],[BounceDate],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_ReportRangeMessageContactBounces] t
	UNION ALL
	SELECT [MessageID],[ContactID],[EmailAddress],[BounceReason],[BounceDetail],[BounceDate],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_ReportRangeMessageContactBounces]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
