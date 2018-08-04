SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_ReportRangeMessageContactRead]
AS

SELECT DISTINCT
	[ETL__multi_query_value_for_audit]
	,CONVERT(NVARCHAR(MAX),[SK]) [SK]
	,CONVERT(NVARCHAR(MAX),[ContactID]) [ContactID]
	,CONVERT(NVARCHAR(MAX),[EmailAddress]) [EmailAddress]
	,CONVERT(NVARCHAR(MAX),[ReadDate]) [ReadDate]
FROM [src].[Listrak_ReportRangeMessageContactRead] WITH (NOLOCK)
GO
