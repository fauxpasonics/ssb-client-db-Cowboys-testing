SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_Clicks] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_Clicks] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[ContactID] [nvarchar](100) NULL,
[EmailAddress] [nvarchar](255) NULL,
[LinkDescription] [nvarchar](500) NULL,
[LinkUrl] [nvarchar](1000) NULL,
[ClickDate] [datetime] NULL,
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
SELECT [ContactID],[EmailAddress],[LinkDescription],[LinkUrl],[ClickDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [ContactID],[EmailAddress],[LinkDescription],[LinkUrl],[ClickDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_Clicks] t
	UNION ALL
	SELECT [ContactID],[EmailAddress],[LinkDescription],[LinkUrl],[ClickDate],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_Clicks]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
