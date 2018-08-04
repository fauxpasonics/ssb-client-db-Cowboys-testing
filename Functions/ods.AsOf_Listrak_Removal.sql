SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_Removal] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_Removal] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MessageID] [nvarchar](100) NULL,
[ContactID] [nvarchar](100) NULL,
[EmailAddress] [nvarchar](255) NULL,
[AdditionDate] [datetime] NULL,
[RemovalDate] [datetime] NULL,
[RemovalMethod] [nvarchar](255) NULL,
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
SELECT [MessageID],[ContactID],[EmailAddress],[AdditionDate],[RemovalDate],[RemovalMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MessageID],[ContactID],[EmailAddress],[AdditionDate],[RemovalDate],[RemovalMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_Removal] t
	UNION ALL
	SELECT [MessageID],[ContactID],[EmailAddress],[AdditionDate],[RemovalDate],[RemovalMethod],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_Removal]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
