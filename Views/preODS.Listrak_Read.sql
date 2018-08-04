SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_Read]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) MessageID_K
	,CONVERT(NVARCHAR(100),[ContactID]) [ContactID_K]
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress_K]
	,CONVERT(DATETIME,[ReadDate]) [ReadDate_K]
FROM [src].[Listrak_ReportRangeMessageContactRead] WITH (NOLOCK)
GO
