SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_List]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(255),[ListID]) [ListID_K]
	,CONVERT(NVARCHAR(255),[ListName]) [ListName]
	,CONVERT(NVARCHAR(255),[CreateDate]) [CreateDate]
	,CONVERT(NVARCHAR(255),[FromName]) [FromName]
	,CONVERT(NVARCHAR(255),[FromEmail]) [FromEmail]
	,CONVERT(NVARCHAR(50),[EnableRemovalLink]) [EnableRemovalLink]
	,CONVERT(NVARCHAR(50),[EnableBrowserLink]) [EnableBrowserLink]
	,CONVERT(INT,[bounceHandling]) [bounceHandling]
	,CONVERT(NVARCHAR(50),[EnableDoubleOptin]) [EnableDoubleOptin]
	,CONVERT(NVARCHAR(50),[EnableListHygiene]) [EnableListHygiene]
	,CONVERT(NVARCHAR(50),[ShowEmailList]) [ShowEmailList]
	,CONVERT(NVARCHAR(50),[ShowAdvancedPersonalization]) [ShowAdvancedPersonalization]
	,CONVERT(INT,[BounceUnsubscribeCount]) [BounceUnsubscribeCount]
	,CONVERT(NVARCHAR(255),[DomainAliasLink]) [DomainAliasLink]
	,CONVERT(NVARCHAR(255),[DomainAliasEmail]) [DomainAliasEmail]
	,CONVERT(NVARCHAR(50),[EnableRSS]) [EnableRSS]
	,CONVERT(NVARCHAR(50),[EnableGoogleAnalytics]) [EnableGoogleAnalytics]
	,CONVERT(NVARCHAR(500),[GoogleTrackingDomains]) [GoogleTrackingDomains]
	,CONVERT(NVARCHAR(50),[EnableInternationalization]) [EnableInternationalization]
	,CONVERT(NVARCHAR(50),[EnableDynamicContent]) [EnableDynamicContent]
	,CONVERT(NVARCHAR(50),[EnableListRemoveHeader]) [EnableListRemoveHeader]
	,CONVERT(NVARCHAR(255),[VmtaID]) [VmtaID]
	,CONVERT(NVARCHAR(255),[VmtaDescription]) [VmtaDescription]
FROM [src].[Listrak_ContactListCollection] WITH (NOLOCK)
GO
