SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [etl].[vw_Listrak_Contact_ManualLoad]
AS


WITH Emails
AS (
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_ActionStepProfiling
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_CSNotification
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_CustomerInfo
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_FACustomerMetrics
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_Source
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_SystemFields
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_VIPSubscriptionInfo
	UNION
	SELECT DISTINCT Email
	FROM src.Listrak_SubscribedContacts_SubscriptionInfo
)

SELECT ci.[CustomerInfo FirstName] AS FirstName
, ci.[CustomerInfo LastName] AS LastName
, ci.[CustomerInfo ZipCode] AS ZipCode
, ci.[CustomerInfo Phone] AS Phone
, ci.[CustomerInfo DOB] AS DOB
, a.Email AS EmailAddress
, facm.[FA Customer Metrics Gender] AS Gender
, ci.[CustomerInfo FavoritePlayer] AS FavoritePlayer
, si.[SubscriptionInfo DC ProShop Offers] AS DCProShopOffers
, si.[SubscriptionInfo DC Newsletter] AS DCNewsletter
, si.[SubscriptionInfo DC Fan Playbook] AS DCFanPlaybook
, si.[SubscriptionInfo DC Events & Ticket Offers] AS DCEventsAndTicketOffers
, si.[SubscriptionInfo AT&T Stadium Events & Ticket Offers] ATTStadiumTicketOffers
, si.[SubscriptionInfo Ford Center Events & Ticket Offers] AS FordCenterEventsAndTicketOffers
, facm.[FA Customer Metrics Spent One Year] AS SpentOneYear
, facm.[FA Customer Metrics Spent Three Year] AS SpentThreeYear
, facm.[FA Customer Metrics Spent Total] AS SpentTotalYear
, facm.[FA Customer Metrics Spent Two Year] SpentwoYear
, facm.[FA Customer Metrics Average Order Value] AS AverageOrderValue
, facm.[FA Customer Metrics Most Browsed Category] AS MostBrowsedCategory
, facm.[FA Customer Metrics Most Browsed Subcategory] AS MostBrowsedSubcategory
, s.[Source VIP] AS VIP
, vipsi.[VIPSubscriptionInfo Service Rep Name] AS ServiceRepName
, ci.[CustomerInfo GenderMale] AS GenderMale
, ci.[CustomerInfo GenderFemale] AS GenderFemale
, ci.[CustomerInfo StateCode] AS StateCode
, vipsi.[VIPSubscriptionInfo AT&T Stadium Suite Holder] AS ATTStadiumSuiteHolder
, vipsi.[VIPSubscriptionInfo DC Corporate Partner] AS DCCorporatePartner
, vipsi.[VIPSubscriptionInfo DC Season Ticket Holder] AS DCSeasonTicketHolder
, vipsi.[VIPSubscriptionInfo DC United Member] AS DCUnitedMember
, vipsi.[VIPSubscriptionInfo CowboysClub] AS CowboysClub
, vipsi.[VIPSubscriptionInfo CowboysFit] AS CowboysFit
FROM Emails a
LEFT JOIN ods.Listrak_SubscribedContacts_ActionStepProfiling asp
	ON a.Email = asp.Email
LEFT JOIN ods.Listrak_SubscribedContacts_CSNotification csn
	ON a.Email = csn.Email
LEFT JOIN ods.Listrak_SubscribedContacts_CustomerInfo ci
	ON a.Email = ci.Email
LEFT JOIN ods.Listrak_SubscribedContacts_FACustomerMetrics facm
	ON a.Email = facm.Email
LEFT JOIN ods.Listrak_SubscribedContacts_Source s
	ON a.Email = s.Email
LEFT JOIN ods.Listrak_SubscribedContacts_SystemFields sf
	ON a.Email = sf.Email
LEFT JOIN ods.Listrak_SubscribedContacts_VIPSubscriptionInfo vipsi
	ON a.Email = vipsi.Email
LEFT JOIN ods.Listrak_SubscribedContacts_SubscriptionInfo si
	ON a.Email = si.Email


GO
