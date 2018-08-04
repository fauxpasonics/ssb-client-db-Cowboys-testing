SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_ContactRest]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) ListID_K
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress_K]
	,CONVERT(NVARCHAR(255),[EmailKey]) [EmailKey]
	,CONVERT(NVARCHAR(255),[SubscriptionState]) [SubscriptionState]
	,CONVERT(DATETIME2,[SubscribeDate]) [SubscribeDate]
	,CONVERT(NVARCHAR(255),[SubscribeMethod]) [SubscribeMethod]
	,CONVERT(DATETIME,[UnsubscribeDate]) [UnsubscribeDate]
	,CONVERT(NVARCHAR(255),[UnsubscribeMethod]) [UnsubscribeMethod]
FROM [src].[Listrak_ContactRest] WITH (NOLOCK)
GO
