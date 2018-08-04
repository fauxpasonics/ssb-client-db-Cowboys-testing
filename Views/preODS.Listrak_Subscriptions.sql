SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_Subscriptions]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [ListID_K]
	,CONVERT(NVARCHAR(100),[ContactID]) [ContactID_K]
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress]
	,CONVERT(DATETIME,[AdditionDate]) [AdditionDate]
	,CONVERT(NVARCHAR(255),[AdditionMethod]) [AdditionMethod]
FROM [src].[Listrak_ReportSubscribedContacts] WITH (NOLOCK)

GO
