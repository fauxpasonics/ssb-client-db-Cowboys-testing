SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****	Revision History

2018-01-12 by DCH	-	change CAST to TRY_CAST for DOB

*****/

CREATE VIEW [etl].[vw_Listrak_ContactPivot]
AS

SELECT ListID, EmailAddress, SubscriptionState, SubscribeDate
	, SubscribeMethod, UnsubscribeDate, UnsubscribeMethod
	, CASE WHEN PivotOutput.FirstName = '' THEN NULL ELSE PivotOutput.FirstName END AS FirstName
	, CASE WHEN PivotOutput.LastName = '' THEN NULL ELSE PivotOutput.LastName END AS LastName
	, CASE WHEN PivotOutput.Gender = '' THEN NULL ELSE PivotOutput.Gender END AS Gender
	, CASE WHEN PivotOutput.Phone = '' THEN NULL ELSE PivotOutput.Phone END AS Phone
	, CASE WHEN PivotOutput.ZipCode = '' THEN NULL ELSE PivotOutput.ZipCode END AS ZipCode
	, CASE WHEN PivotOutput.ATTStadiumEventsAndTicketOffers = '' THEN NULL ELSE PivotOutput.ATTStadiumEventsAndTicketOffers END AS ATTStadiumEventsAndTicketOffers
	, CASE WHEN PivotOutput.AverageOrderValue = '' THEN NULL ELSE PivotOutput.AverageOrderValue END AS AverageOrderValue
	, CASE WHEN PivotOutput.DCEventsAndTicketOffers = '' THEN NULL ELSE PivotOutput.DCEventsAndTicketOffers END AS DCEventsAndTicketOffers
	, CASE WHEN PivotOutput.DCFanPlaybook = '' THEN NULL ELSE PivotOutput.DCFanPlaybook END AS DCFanPlaybook
	, CASE WHEN PivotOutput.DCNewsletter = '' THEN NULL ELSE PivotOutput.DCNewsletter END AS DCNewsletter
	, CASE WHEN PivotOutput.DCProShopOffers = '' THEN NULL ELSE PivotOutput.DCProShopOffers END AS DCProShopOffers
	, CASE WHEN PivotOutput.FavoritePlayer = '' THEN NULL ELSE PivotOutput.FavoritePlayer END AS FavoritePlayer
	, CASE WHEN PivotOutput.FordCenterEventsAndTicketOffers = '' THEN NULL ELSE PivotOutput.FordCenterEventsAndTicketOffers END AS FordCenterEventsAndTicketOffers
	, CASE WHEN PivotOutput.MostBrowsedCategory = '' THEN NULL ELSE PivotOutput.MostBrowsedCategory END AS MostBrowsedCategory
	, CASE WHEN PivotOutput.MostBrowsedSubcategory = '' THEN NULL ELSE PivotOutput.MostBrowsedSubcategory END AS MostBrowsedSubcategory
	, CASE WHEN PivotOutput.SpentOneYear = '' THEN NULL ELSE PivotOutput.SpentOneYear END AS SpentOneYear
	, CASE WHEN PivotOutput.SpentTwoYear = '' THEN NULL ELSE PivotOutput.SpentTwoYear END AS SpentTwoYear
	, CASE WHEN PivotOutput.SpentThreeYear = '' THEN NULL ELSE PivotOutput.SpentThreeYear END AS SpentThreeYear
	, CASE WHEN PivotOutput.SpentTotal = '' THEN NULL ELSE PivotOutput.SpentTotal END AS SpentTotal

FROM (
	SELECT a.ListID, c.EmailAddress, c.SubscriptionState, c.SubscribeDate, c.SubscribeMethod
	, c.UnsubscribeDate, c.UnsubscribeMethod
	, a.AttributeName, f.SegmentationFieldValue
	FROM ods.Listrak_ContactRest c (NOLOCK)
	JOIN ods.Listrak_ContactRest_FieldValues f (NOLOCK)
		ON c.ListID = f.ListID
		AND c.EmailAddress = f.EmailAddress
	JOIN ods.Listrak_Attributes a (NOLOCK)
		ON f.SegmentationFieldId = a.AttributeID
		AND f.ListID = a.ListID
	) AS ContactKeyValuePairs
PIVOT (
	MIN(SegmentationFieldValue)
	FOR AttributeName IN 
		(
		  [ATTStadiumEventsAndTicketOffers]
		, [AverageOrderValue]
		, [DCEventsAndTicketOffers]
		, [DCFanPlaybook]
		, [DCNewsletter]
		, [DCProShopOffers]
		, [FavoritePlayer]
		, [FirstName]
		, [FordCenterEventsAndTicketOffers]
		, [Gender]
		, [LastName]
		, [MostBrowsedCategory]
		, [MostBrowsedSubcategory]
		, [Phone]
		, [SpentOneYear]
		, [SpentTwoYear]
		, [SpentThreeYear]
		, [SpentTotal]
		, [ZipCode]
		)
	) AS PivotOutput
--ORDER BY PivotOutput.EmailAddress
GO
