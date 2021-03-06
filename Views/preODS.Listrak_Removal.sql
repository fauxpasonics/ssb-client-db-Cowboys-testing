SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_Removal]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) MessageID_K
	,CONVERT(NVARCHAR(100),[ContactID]) [ContactID_K]
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress_K]
	,CONVERT(DATETIME,[AdditionDate]) [AdditionDate_K]
	,CONVERT(DATETIME,[RemovalDate]) [RemovalDate_K]
	,CONVERT(NVARCHAR(255),[RemovalMethod]) [RemovalMethod_K]
FROM [src].[Listrak_ReportRangeMessageContactRemoval] WITH (NOLOCK)
GO
