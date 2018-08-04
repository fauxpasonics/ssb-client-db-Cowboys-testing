SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*****	Revision History

2018-01-12 by DCH	-	change CAST to TRY_CAST for DOB

*****/

CREATE VIEW [etl].[vw_Listrak_ContactPivot_bkp]
AS

SELECT CASE WHEN PivotOutput.FirstName <> '' THEN PivotOutput.FirstName ELSE NULL END AS FirstName
	, CASE WHEN PivotOutput.LastName <> '' THEN PivotOutput.LastName ELSE NULL END AS LastName
	, CASE WHEN PivotOutput.VIP <> '' THEN PivotOutput.VIP ELSE NULL END AS VIP
	, CASE WHEN PivotOutput.Gender <> '' THEN PivotOutput.Gender ELSE NULL END AS Gender
	, CASE WHEN PivotOutput.GenderMale <> '' THEN PivotOutput.GenderMale ELSE NULL END AS GenderMale
	, CASE WHEN PivotOutput.GenderFemale <> '' THEN PivotOutput.GenderFemale ELSE NULL END AS GenderFemale
	, TRY_CAST((CASE WHEN PivotOutput.DOB <> '' THEN PivotOutput.DOB ELSE NULL END) AS DATE) AS DOB
	, CASE WHEN PivotOutput.BirthDay <> '' THEN PivotOutput.BirthDay ELSE NULL END AS BirthDay
	, CASE WHEN PivotOutput.BirthMonth <> '' THEN PivotOutput.BirthMonth ELSE NULL END AS BirthMonth
	, CASE WHEN PivotOutput.BirthYear <> '' THEN PivotOutput.BirthYear ELSE NULL END AS BirthYear
	, CASE WHEN PivotOutput.EmailAddress <> '' THEN PivotOutput.EmailAddress ELSE NULL END AS EmailAddress
	, CASE WHEN PivotOutput.Phone <> '' THEN PivotOutput.Phone ELSE NULL END AS Phone
	, CASE WHEN PivotOutput.StateCode <> '' THEN PivotOutput.StateCode ELSE NULL END AS StateCode
	, CASE WHEN PivotOutput.ZipCode <> '' THEN PivotOutput.ZipCode ELSE NULL END AS ZipCode
	, CASE WHEN PivotOutput.SalesRepName <> '' THEN PivotOutput.SalesRepName ELSE NULL END AS SalesRepName
	, CASE WHEN PivotOutput.SalesRepPhone <> '' THEN PivotOutput.SalesRepPhone ELSE NULL END AS SalesRepPhone
	, CASE WHEN PivotOutput.SalesRepEmailAddress <> '' THEN PivotOutput.SalesRepEmailAddress ELSE NULL END AS SalesRepEmailAddress
	, CASE WHEN PivotOutput.ServiceRepName <> '' THEN PivotOutput.ServiceRepName ELSE NULL END AS ServiceRepName
	, CASE WHEN PivotOutput.ServiceRepPhone <> '' THEN PivotOutput.ServiceRepPhone ELSE NULL END AS ServiceRepPhone
	, CASE WHEN PivotOutput.ServiceRepEmailAddress <> '' THEN PivotOutput.ServiceRepEmailAddress ELSE NULL END AS ServiceRepEmailAddress
	, CASE WHEN PivotOutput.Account_ExternalEvent <> '' THEN PivotOutput.Account_ExternalEvent ELSE NULL END AS Account_ExternalEvent
	, CASE WHEN PivotOutput.Account_Source <> '' THEN PivotOutput.Account_Source ELSE NULL END AS Account_Source
	, CASE WHEN PivotOutput.ATTStadiumEventsAndTicketOffers <> '' THEN PivotOutput.ATTStadiumEventsAndTicketOffers ELSE NULL END AS ATTStadiumEventsAndTicketOffers
	, CASE WHEN PivotOutput.ATTStadiumSuiteHolder <> '' THEN PivotOutput.ATTStadiumSuiteHolder ELSE NULL END AS ATTStadiumSuiteHolder
	, CASE WHEN PivotOutput.AverageOrderValue <> '' THEN PivotOutput.AverageOrderValue ELSE NULL END AS AverageOrderValue
	, CASE WHEN PivotOutput.AvgReorderDays <> '' THEN PivotOutput.AvgReorderDays ELSE NULL END AS AvgReorderDays
	, CASE WHEN PivotOutput.Checkout_ExternalEvent <> '' THEN PivotOutput.Checkout_ExternalEvent ELSE NULL END AS Checkout_ExternalEvent
	, CASE WHEN PivotOutput.Checkout_Source <> '' THEN PivotOutput.Checkout_Source ELSE NULL END AS Checkout_Source
	, CASE WHEN PivotOutput.Coupon <> '' THEN PivotOutput.Coupon ELSE NULL END AS Coupon
	, CASE WHEN PivotOutput.CouponCode <> '' THEN PivotOutput.CouponCode ELSE NULL END AS CouponCode
	, CASE WHEN PivotOutput.CouponExpiration <> '' THEN PivotOutput.CouponExpiration ELSE NULL END AS CouponExpiration
	, CASE WHEN PivotOutput.CowboysClub <> '' THEN PivotOutput.CowboysClub ELSE NULL END AS CowboysClub
	, CASE WHEN PivotOutput.CowboysFit <> '' THEN PivotOutput.CowboysFit ELSE NULL END AS CowboysFit
	, CASE WHEN PivotOutput.CSNotify <> '' THEN PivotOutput.CSNotify ELSE NULL END AS CSNotify
	, CASE WHEN PivotOutput.CSReason <> '' THEN PivotOutput.CSReason ELSE NULL END AS CSReason
	, CASE WHEN PivotOutput.CustomerFlag <> '' THEN PivotOutput.CustomerFlag ELSE NULL END AS CustomerFlag
	, CASE WHEN PivotOutput.DCCorporatePartner <> '' THEN PivotOutput.DCCorporatePartner ELSE NULL END AS DCCorporatePartner
	, CASE WHEN PivotOutput.DCEventsAndTicketOffers <> '' THEN PivotOutput.DCEventsAndTicketOffers ELSE NULL END AS DCEventsAndTicketOffers
	, CASE WHEN PivotOutput.DCFanPlaybook <> '' THEN PivotOutput.DCFanPlaybook ELSE NULL END AS DCFanPlaybook
	, CASE WHEN PivotOutput.DCNewsletter <> '' THEN PivotOutput.DCNewsletter ELSE NULL END AS DCNewsletter
	, CASE WHEN PivotOutput.DCProShopOffers <> '' THEN PivotOutput.DCProShopOffers ELSE NULL END AS DCProShopOffers
	, CASE WHEN PivotOutput.DCSeasonTicketHolder <> '' THEN PivotOutput.DCSeasonTicketHolder ELSE NULL END AS DCSeasonTicketHolder
	, CASE WHEN PivotOutput.DCUnitedMember <> '' THEN PivotOutput.DCUnitedMember ELSE NULL END AS DCUnitedMember
	, CASE WHEN PivotOutput.DCUnitedMembershipType <> '' THEN PivotOutput.DCUnitedMembershipType ELSE NULL END AS DCUnitedMembershipType
	, CASE WHEN PivotOutput.DCUnitedRefreshDate <> '' THEN PivotOutput.DCUnitedRefreshDate ELSE NULL END AS DCUnitedRefreshDate
	, CASE WHEN PivotOutput.DefaultBirthMonth <> '' THEN PivotOutput.DefaultBirthMonth ELSE NULL END AS DefaultBirthMonth
	, CASE WHEN PivotOutput.EmailToken <> '' THEN PivotOutput.EmailToken ELSE NULL END AS EmailToken
	, CASE WHEN PivotOutput.EnteredWelcomeSeries <> '' THEN PivotOutput.EnteredWelcomeSeries ELSE NULL END AS EnteredWelcomeSeries
	, CASE WHEN PivotOutput.FanManagerSegmentationTag <> '' THEN PivotOutput.FanManagerSegmentationTag ELSE NULL END AS FanManagerSegmentationTag
	, CASE WHEN PivotOutput.FavoritePlayer <> '' THEN PivotOutput.FavoritePlayer ELSE NULL END AS FavoritePlayer
	, CASE WHEN PivotOutput.FirstOrderDate <> '' THEN PivotOutput.FirstOrderDate ELSE NULL END AS FirstOrderDate
	, CASE WHEN PivotOutput.FivePointsBlue <> '' THEN PivotOutput.FivePointsBlue ELSE NULL END AS FivePointsBlue
	, CASE WHEN PivotOutput.FordCenterEventsAndTicketOffers <> '' THEN PivotOutput.FordCenterEventsAndTicketOffers ELSE NULL END AS FordCenterEventsAndTicketOffers
	, CASE WHEN PivotOutput.FreshAddressScore <> '' THEN PivotOutput.FreshAddressScore ELSE NULL END AS FreshAddressScore
	, CASE WHEN PivotOutput.GuestCheckout <> '' THEN PivotOutput.GuestCheckout ELSE NULL END AS GuestCheckout
	, CASE WHEN PivotOutput.Is18orOlder <> '' THEN PivotOutput.Is18orOlder ELSE NULL END AS Is18orOlder
	, CASE WHEN PivotOutput.JKTempFlag <> '' THEN PivotOutput.JKTempFlag ELSE NULL END AS JKTempFlag
	, CASE WHEN PivotOutput.LastBrowsedBrand <> '' THEN PivotOutput.LastBrowsedBrand ELSE NULL END AS LastBrowsedBrand
	, CASE WHEN PivotOutput.LastBrowsedCategory <> '' THEN PivotOutput.LastBrowsedCategory ELSE NULL END AS LastBrowsedCategory
	, CASE WHEN PivotOutput.LastBrowsedSubcategory <> '' THEN PivotOutput.LastBrowsedSubcategory ELSE NULL END AS LastBrowsedSubcategory
	, CASE WHEN PivotOutput.LastOrderDate <> '' THEN PivotOutput.LastOrderDate ELSE NULL END AS LastOrderDate
	, CASE WHEN PivotOutput.LastSiteVisit <> '' THEN PivotOutput.LastSiteVisit ELSE NULL END AS LastSiteVisit
	, CASE WHEN PivotOutput.LDTempFlag <> '' THEN PivotOutput.LDTempFlag ELSE NULL END AS LDTempFlag
	, CASE WHEN PivotOutput.Miniform_ExternalEvent <> '' THEN PivotOutput.Miniform_ExternalEvent ELSE NULL END AS Miniform_ExternalEvent
	, CASE WHEN PivotOutput.Miniform_Source <> '' THEN PivotOutput.Miniform_Source ELSE NULL END AS Miniform_Source
	, CASE WHEN PivotOutput.Modal_ExternalEvent <> '' THEN PivotOutput.Modal_ExternalEvent ELSE NULL END AS Modal_ExternalEvent
	, CASE WHEN PivotOutput.Modal_Source <> '' THEN PivotOutput.Modal_Source ELSE NULL END AS Modal_Source
	, CASE WHEN PivotOutput.ModalA_Hybrid_ExternalEvent <> '' THEN PivotOutput.ModalA_Hybrid_ExternalEvent ELSE NULL END AS ModalA_Hybrid_ExternalEvent
	, CASE WHEN PivotOutput.ModalA_Hybrid_Source <> '' THEN PivotOutput.ModalA_Hybrid_Source ELSE NULL END AS ModalA_Hybrid_Source
	, CASE WHEN PivotOutput.ModalB_Normal_ExternalEvent <> '' THEN PivotOutput.ModalB_Normal_ExternalEvent ELSE NULL END AS ModalB_Normal_ExternalEvent
	, CASE WHEN PivotOutput.ModalB_Normal_Source <> '' THEN PivotOutput.ModalB_Normal_Source ELSE NULL END AS ModalB_Normal_Source
	, CASE WHEN PivotOutput.MostBrowsedBrand <> '' THEN PivotOutput.MostBrowsedBrand ELSE NULL END AS MostBrowsedBrand
	, CASE WHEN PivotOutput.MostBrowsedCategory <> '' THEN PivotOutput.MostBrowsedCategory ELSE NULL END AS MostBrowsedCategory
	, CASE WHEN PivotOutput.MostBrowsedSubcategory <> '' THEN PivotOutput.MostBrowsedSubcategory ELSE NULL END AS MostBrowsedSubcategory
	, CASE WHEN PivotOutput.NewFoundEmail <> '' THEN PivotOutput.NewFoundEmail ELSE NULL END AS NewFoundEmail
	, CASE WHEN PivotOutput.NewFoundEmailSegment <> '' THEN PivotOutput.NewFoundEmailSegment ELSE NULL END AS NewFoundEmailSegment
	, CASE WHEN PivotOutput.NewModal <> '' THEN PivotOutput.NewModal ELSE NULL END AS NewModal
	, CASE WHEN PivotOutput.NewModalA_Hybrid <> '' THEN PivotOutput.NewModalA_Hybrid ELSE NULL END AS NewModalA_Hybrid
	, CASE WHEN PivotOutput.NewModalB_Normal <> '' THEN PivotOutput.NewModalB_Normal ELSE NULL END AS NewModalB_Normal
	, CASE WHEN PivotOutput.OfficialSite <> '' THEN PivotOutput.OfficialSite ELSE NULL END AS OfficialSite
	, CASE WHEN PivotOutput.OfficialSiteReceived <> '' THEN PivotOutput.OfficialSiteReceived ELSE NULL END AS OfficialSiteReceived
	, CASE WHEN PivotOutput.OrderCount <> '' THEN PivotOutput.OrderCount ELSE NULL END AS OrderCount
	, CASE WHEN PivotOutput.OSTempFlag <> '' THEN PivotOutput.OSTempFlag ELSE NULL END AS OSTempFlag
	, CASE WHEN PivotOutput.PrefCenter_ExternalEvent <> '' THEN PivotOutput.PrefCenter_ExternalEvent ELSE NULL END AS PrefCenter_ExternalEvent
	, CASE WHEN PivotOutput.PrefCenter_Source <> '' THEN PivotOutput.PrefCenter_Source ELSE NULL END AS PrefCenter_Source
	, CASE WHEN PivotOutput.ProjectedOrderDate <> '' THEN PivotOutput.ProjectedOrderDate ELSE NULL END AS ProjectedOrderDate
	, CASE WHEN PivotOutput.ProShop <> '' THEN PivotOutput.ProShop ELSE NULL END AS ProShop
	, CASE WHEN PivotOutput.PurchaseSources <> '' THEN PivotOutput.PurchaseSources ELSE NULL END AS PurchaseSources
	, CASE WHEN PivotOutput.RecentItemsBrowsed <> '' THEN PivotOutput.RecentItemsBrowsed ELSE NULL END AS RecentItemsBrowsed
	, CASE WHEN PivotOutput.RecentItemsBrowsedOverflow <> '' THEN PivotOutput.RecentItemsBrowsedOverflow ELSE NULL END AS RecentItemsBrowsedOverflow
	, CASE WHEN PivotOutput.RecentItemsPurchased <> '' THEN PivotOutput.RecentItemsPurchased ELSE NULL END AS RecentItemsPurchased
	, CASE WHEN PivotOutput.RecentItemsPurchasedOverflow <> '' THEN PivotOutput.RecentItemsPurchasedOverflow ELSE NULL END AS RecentItemsPurchasedOverflow
	, CASE WHEN PivotOutput.SpentOneYear <> '' THEN PivotOutput.SpentOneYear ELSE NULL END AS SpentOneYear
	, CASE WHEN PivotOutput.SpentThreeYear <> '' THEN PivotOutput.SpentThreeYear ELSE NULL END AS SpentThreeYear
	, CASE WHEN PivotOutput.SpentTotal <> '' THEN PivotOutput.SpentTotal ELSE NULL END AS SpentTotal
	, CASE WHEN PivotOutput.SpentTwoYear <> '' THEN PivotOutput.SpentTwoYear ELSE NULL END AS SpentTwoYear
	, CASE WHEN PivotOutput.StadiumClub <> '' THEN PivotOutput.StadiumClub ELSE NULL END AS StadiumClub
	, CASE WHEN PivotOutput.StadiumEventsReceived <> '' THEN PivotOutput.StadiumEventsReceived ELSE NULL END AS StadiumEventsReceived
	, CASE WHEN PivotOutput.StarInFriscoReceived <> '' THEN PivotOutput.StarInFriscoReceived ELSE NULL END AS StarInFriscoReceived
	, CASE WHEN PivotOutput.STHSuiteRefreshDate <> '' THEN PivotOutput.STHSuiteRefreshDate ELSE NULL END AS STHSuiteRefreshDate
	, CASE WHEN PivotOutput.TheStar <> '' THEN PivotOutput.TheStar ELSE NULL END AS TheStar
	, CASE WHEN PivotOutput.TheStarInformationAndNotifications <> '' THEN PivotOutput.TheStarInformationAndNotifications ELSE NULL END AS TheStarInformationAndNotifications
	, CASE WHEN PivotOutput.TheStarTours <> '' THEN PivotOutput.TheStarTours ELSE NULL END AS TheStarTours
	, CASE WHEN PivotOutput.WelcomeSeriesReceived <> '' THEN PivotOutput.WelcomeSeriesReceived ELSE NULL END AS WelcomeSeriesReceived
FROM (
	SELECT c.EmailAddress, a.AttributeName, c.AttributeValue
	FROM ods.Listrak_Contact c (NOLOCK)
	JOIN ods.Listrak_Attributes a (NOLOCK)
		ON c.AttributeID = a.AttributeID
	) AS ContactKeyValuePairs
PIVOT (
	MIN(AttributeValue)
	FOR AttributeName IN 
		(
		  [Account_ExternalEvent]
		, [Account_Source]
		, [ATTStadiumEventsAndTicketOffers]
		, [ATTStadiumSuiteHolder]
		, [AverageOrderValue]
		, [AvgReorderDays]
		, [BirthDay]
		, [BirthMonth]
		, [BirthYear]
		, [Checkout_ExternalEvent]
		, [Checkout_Source]
		, [Coupon]
		, [CouponCode]
		, [CouponExpiration]
		, [CowboysClub]
		, [CowboysFit]
		, [CSNotify]
		, [CSReason]
		, [CustomerFlag]
		, [DCCorporatePartner]
		, [DCEventsAndTicketOffers]
		, [DCFanPlaybook]
		, [DCNewsletter]
		, [DCProShopOffers]
		, [DCSeasonTicketHolder]
		, [DCUnitedMember]
		, [DCUnitedMembershipType]
		, [DCUnitedRefreshDate]
		, [DefaultBirthMonth]
		, [DOB]
		, [EmailToken]
		, [EnteredWelcomeSeries]
		, [FanManagerSegmentationTag]
		, [FavoritePlayer]
		, [FirstName]
		, [FirstOrderDate]
		, [FivePointsBlue]
		, [FordCenterEventsAndTicketOffers]
		, [FreshAddressScore]
		, [Gender]
		, [GenderFemale]
		, [GenderMale]
		, [GuestCheckout]
		, [Is18orOlder]
		, [JKTempFlag]
		, [LastBrowsedBrand]
		, [LastBrowsedCategory]
		, [LastBrowsedSubcategory]
		, [LastName]
		, [LastOrderDate]
		, [LastSiteVisit]
		, [LDTempFlag]
		, [Miniform_ExternalEvent]
		, [Miniform_Source]
		, [Modal_Source]
		, [Modal_ExternalEvent]
		, [ModalA_Hybrid_ExternalEvent]
		, [ModalA_Hybrid_Source]
		, [ModalB_Normal_ExternalEvent]
		, [ModalB_Normal_Source]
		, [MostBrowsedBrand]
		, [MostBrowsedCategory]
		, [MostBrowsedSubcategory]
		, [NewFoundEmail]
		, [NewFoundEmailSegment]
		, [NewModal]
		, [NewModalA_Hybrid]
		, [NewModalB_Normal]
		, [OfficialSite]
		, [OfficialSiteReceived]
		, [OrderCount]
		, [OSTempFlag]
		, [Phone]
		, [PrefCenter_ExternalEvent]
		, [PrefCenter_Source]
		, [ProjectedOrderDate]
		, [ProShop]
		, [PurchaseSources]
		, [RecentItemsBrowsed]
		, [RecentItemsBrowsedOverflow]
		, [RecentItemsPurchased]
		, [RecentItemsPurchasedOverflow]
		, [SalesRepEmailAddress]
		, [SalesRepName]
		, [SalesRepPhone]
		, [ServiceRepEmailAddress]
		, [ServiceRepName]
		, [ServiceRepPhone]
		, [SpentOneYear]
		, [SpentThreeYear]
		, [SpentTotal]
		, [SpentTwoYear]
		, [StadiumClub]
		, [StadiumEventsReceived]
		, [StarInFriscoReceived]
		, [StateCode]
		, [STHSuiteRefreshDate]
		, [TheStar]
		, [TheStarInformationAndNotifications]
		, [TheStarTours]
		, [VIP]
		, [WelcomeSeriesReceived]
		, [ZipCode]
		)
	) AS PivotOutput
GO
