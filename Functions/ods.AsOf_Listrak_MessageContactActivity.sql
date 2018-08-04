SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Listrak_MessageContactActivity] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Listrak_MessageContactActivity] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MsgID] [nvarchar](100) NULL,
[ContactID] [nvarchar](100) NULL,
[EmailAddress] [nvarchar](255) NULL,
[SendDate] [datetime] NULL,
[Opened] [bit] NULL,
[Read] [bit] NULL,
[ClickCount] [int] NULL,
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
SELECT [MsgID],[ContactID],[EmailAddress],[SendDate],[Opened],[Read],[ClickCount],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MsgID],[ContactID],[EmailAddress],[SendDate],[Opened],[Read],[ClickCount],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Listrak_MessageContactActivity] t
	UNION ALL
	SELECT [MsgID],[ContactID],[EmailAddress],[SendDate],[Opened],[Read],[ClickCount],[BounceCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Listrak_MessageContactActivity]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
