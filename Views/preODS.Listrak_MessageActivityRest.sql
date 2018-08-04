SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_MessageActivityRest]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) MessageID_K
	,CONVERT(NVARCHAR(50),[Abuse]) [Abuse]
	,CONVERT(DATETIME2,[ActivityDate]) [ActivityDate]
	,CONVERT(NVARCHAR(50),[Bounce]) [Bounce]
	,CONVERT(NVARCHAR(500),[BounceReason]) [BounceReason]
	,CONVERT(NVARCHAR(50),[Click]) [Click]
	,CONVERT(INT,[ClickCount]) [ClickCount]
	,CONVERT(NVARCHAR(500),[EmailAddress]) [EmailAddress_K]
	,CONVERT(NVARCHAR(50),[Open]) [Open]
	,CONVERT(DECIMAL(18,6),[OrderTotal]) [OrderTotal]
	,CONVERT(NVARCHAR(50),[Read]) [Read]
	,CONVERT(DATETIME2,[SendDate]) [SendDate]
	,CONVERT(NVARCHAR(50),[Unsubscribe]) [Unsubscribe]
	,CONVERT(DATETIME2,[VisitDate]) [VisitDate]
FROM [src].[Listrak_MessageActivityRest] WITH (NOLOCK)
GO
