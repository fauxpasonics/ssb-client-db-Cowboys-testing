SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[Load_Listrak_SubcribedContacts]
AS

-- Advocare 348649 --
BEGIN
	MERGE ods.Listrak_SubscribedContacts AS TARGET
	USING
		(
			SELECT Email AS EmailAddress
				, CASE WHEN ISNULL([Unsubscribe Date], '') = '' THEN 'Subscribed'
					ELSE 'Unsubscribed' END AS SubscriptionState
				, [Subscribe Date (UTC-05)] AS SubscribeDate
				, Method AS SubscribeMethod
				, [Unsubscribe Date] AS UnsubscribeDate
				, [Name First Name] AS FirstName
				, [Name Last Name] AS LastName
				, ETL__CreatedDate
				, GETDATE() AS ETL__UpdatedDate
				, 348649 AS ListID
			FROM ods.Listrak_SubscribedContacts_Advocare
		) AS SOURCE
	ON (TARGET.ListID = SOURCE.ListID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		)
	WHEN MATCHED AND SOURCE.ETL__CreatedDate > TARGET.ETL__CreatedDate
		AND (SOURCE.FirstName <> TARGET.FirstName
			OR SOURCE.LastName <> TARGET.LastName
			OR SOURCE.UnsubscribeDate <> TARGET.UnsubscribeDate
			) THEN
		UPDATE SET
			  TARGET.FirstName = SOURCE.FirstName
			, TARGET.LastName = SOURCE.LastName
			, TARGET.ETL__UpdatedDate = SOURCE.ETL__UpdatedDate
			, TARGET.UnsubscribeDate = SOURCE.UnsubscribeDate
	WHEN NOT MATCHED THEN
		INSERT	( ListID
				, EmailAddress
				, SubscriptionState
				, SubscribeDate
				, SubscribeMethod
				, UnsubscribeDate
				, FirstName
				, LastName
				, ETL__CreatedDate
				, ETL__UpdatedDate
				)
		VALUES	( SOURCE.ListID
				, SOURCE.EmailAddress
				, SOURCE.SubscriptionState
				, SOURCE.SubscribeDate
				, SOURCE.SubscribeMethod
				, SOURCE.UnsubscribeDate
				, SOURCE.FirstName
				, SOURCE.LastName
				, SOURCE.ETL__CreatedDate
				, SOURCE.ETL__UpdatedDate
				);
END

-- Cowboys Master 348073 --
BEGIN
	MERGE ods.Listrak_SubscribedContacts AS TARGET
	USING
		(
			SELECT Email AS EmailAddress
				, CASE WHEN ISNULL([Unsubscribe Date (UTC-05)], '') = '' THEN 'Subscribed'
					ELSE 'Unsubscribed' END AS SubscriptionState
				, [Subscribe Date (UTC-05)] AS SubscribeDate
				, Method AS SubscribeMethod
				, [Unsubscribe Date (UTC-05)] AS UnsubscribeDate
				, [CustomerInfo FirstName] AS FirstName
				, [CustomerInfo LastName] AS LastName
				, CAST([CustomerInfo Phone] AS NVARCHAR(50)) AS Phone
				, [CustomerInfo ZipCode] AS ZipCode
				, CAST([SubscriptionInfo AT&T Stadium Events & Ticket Offers] AS NVARCHAR(20)) AS ATTStadiumEventsAndTicketOffers
				, CAST([FA Customer Metrics Average Order Value] AS NVARCHAR(50)) AS AverageOrderValue
				, CAST([SubscriptionInfo DC Events & Ticket Offers] AS NVARCHAR(20)) AS DCEventsAndTicketOffers
				, CAST([SubscriptionInfo DC Fan Playbook] AS NVARCHAR(20)) AS DCFanPlaybook
				, CAST([SubscriptionInfo DC Newsletter] AS NVARCHAR(20)) AS DCNewsletter
				, CAST([SubscriptionInfo DC ProShop Offers] AS NVARCHAR(20)) AS DCProShopOffers
				, CAST([CustomerInfo FavoritePlayer] AS NVARCHAR(50)) AS FavoritePlayer
				, CAST([SubscriptionInfo Ford Center Events & Ticket Offers] AS NVARCHAR(20)) AS FordCenterEventsAndTicketOffers
				, [FA Customer Metrics Last Browsed Category] AS MostBrowsedCategory
				, [FA Customer Metrics Last Browsed Subcategory] AS MostBrowsedSubcategory
				, TRY_CAST([FA Customer Metrics Spent One Year] AS DECIMAL(18,6)) AS SpentOneYear
				, TRY_CAST([FA Customer Metrics Spent Two Year] AS DECIMAL(18,6)) AS SpentTwoYear
				, TRY_CAST([FA Customer Metrics Spent Three Year] AS DECIMAL(18,6)) AS SpentThreeYear
				, TRY_CAST([FA Customer Metrics Spent Total] AS DECIMAL(18,6)) AS SpentTotal
				, ETL__CreatedDate
				, GETDATE() AS ETL__UpdatedDate
				, 348073 AS ListID
			--SELECT *
			FROM ods.Listrak_SubscribedContacts_CowboysMaster
		) AS SOURCE
	ON (TARGET.ListID = SOURCE.ListID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		)
	WHEN MATCHED AND SOURCE.ETL__CreatedDate > TARGET.ETL__CreatedDate
		AND (SOURCE.FirstName <> TARGET.FirstName
			OR SOURCE.LastName <> TARGET.LastName
			OR SOURCE.Phone <> TARGET.Phone
			OR SOURCE.ZipCode <> TARGET.ZipCode
			OR SOURCE.ATTStadiumEventsAndTicketOffers <> TARGET.ATTStadiumEventsAndTicketOffers
			OR SOURCE.DCEventsAndTicketOffers <> TARGET.DCEventsAndTicketOffers
			OR SOURCE.DCFanPlaybook <> TARGET.DCFanPlaybook
			OR SOURCE.DCNewsletter <> TARGET.DCNewsletter
			OR SOURCE.DCProShopOffers <>  TARGET.DCProShopOffers
			OR SOURCE.FordCenterEventsAndTicketOffers <> TARGET.FordCenterEventsAndTicketOffers
			OR SOURCE.UnsubscribeDate <> TARGET.UnsubscribeDate
			) THEN
		UPDATE SET
			  TARGET.FirstName = SOURCE.FirstName
			, TARGET.LastName = SOURCE.LastName
			, TARGET.Phone = SOURCE.Phone
			, TARGET.ZipCode = SOURCE.ZipCode
			, TARGET.ATTStadiumEventsAndTicketOffers = SOURCE.ATTStadiumEventsAndTicketOffers
			, TARGET.DCEventsAndTicketOffers = SOURCE.DCEventsAndTicketOffers
			, TARGET.DCFanPlaybook = SOURCE.DCFanPlaybook
			, TARGET.DCNewsletter = SOURCE.DCNewsletter
			, TARGET.DCProShopOffers = SOURCE.DCProShopOffers
			, TARGET.FordCenterEventsAndTicketOffers = SOURCE.FordCenterEventsAndTicketOffers
			, TARGET.ETL__UpdatedDate = SOURCE.ETL__UpdatedDate
			, TARGET.UnsubscribeDate = SOURCE.UnsubscribeDate
	WHEN NOT MATCHED THEN
		INSERT	( ListID
				, EmailAddress
				, SubscriptionState
				, SubscribeDate
				, SubscribeMethod
				, UnsubscribeDate
				, FirstName
				, LastName
				, Phone
				, ZipCode
				, ATTStadiumEventsAndTicketOffers
				, AverageOrderValue
				, DCEventsAndTicketOffers
				, DCFanPlaybook
				, DCNewsletter
				, DCProShopOffers
				, FavoritePlayer
				, FordCenterEventsAndTicketOffers
				, MostBrowsedCategory
				, MostBrowsedSubcategory
				, SpentOneYear
				, SpentTwoYear
				, SpentThreeYear
				, SpentTotal
				, ETL__CreatedDate
				, ETL__UpdatedDate
				)
		VALUES	( SOURCE.ListID
				, SOURCE.EmailAddress
				, SOURCE.SubscriptionState
				, SOURCE.SubscribeDate
				, SOURCE.SubscribeMethod
				, SOURCE.UnsubscribeDate
				, SOURCE.FirstName
				, SOURCE.LastName
				, SOURCE.Phone
				, SOURCE.ZipCode
				, SOURCE.ATTStadiumEventsAndTicketOffers
				, SOURCE.AverageOrderValue
				, SOURCE.DCEventsAndTicketOffers
				, SOURCE.DCFanPlaybook
				, SOURCE.DCNewsletter
				, SOURCE.DCProShopOffers
				, SOURCE.FavoritePlayer
				, SOURCE.FordCenterEventsAndTicketOffers
				, SOURCE.MostBrowsedCategory
				, SOURCE.MostBrowsedSubcategory
				, SOURCE.SpentOneYear
				, SOURCE.SpentTwoYear
				, SOURCE.SpentThreeYear
				, SOURCE.SpentTotal
				, SOURCE.ETL__CreatedDate
				, SOURCE.ETL__UpdatedDate
				);
END
	
-- Fans United Master 348648 --
BEGIN
	MERGE ods.Listrak_SubscribedContacts AS TARGET
	USING
		(
			SELECT Email AS EmailAddress
				, CASE WHEN ISNULL([Unsubscribe Date], '') = '' THEN 'Subscribed'
					ELSE 'Unsubscribed' END AS SubscriptionState
				, [Subscribe Date (UTC-05)] AS SubscribeDate
				, Method AS SubscribeMethod
				, [Unsubscribe Date] AS UnsubscribeDate
				, [Name First Name] AS FirstName
				, [Name Last Name] AS LastName
				, [CustomerInfo Phone] AS Phone
				, [Address Zip Code] AS ZipCode
				, ETL__CreatedDate
				, GETDATE() AS ETL__UpdatedDate
				, 348648 AS ListID
			--SELECT *
			FROM ods.Listrak_SubscribedContacts_FansUnitedMaster
		) AS SOURCE
	ON (TARGET.ListID = SOURCE.ListID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		)
	WHEN MATCHED AND SOURCE.ETL__CreatedDate > TARGET.ETL__CreatedDate
		AND (SOURCE.FirstName <> TARGET.FirstName
			OR SOURCE.LastName <> TARGET.LastName
			OR SOURCE.Phone <> TARGET.Phone
			OR SOURCE.ZipCode <> TARGET.ZipCode
			OR SOURCE.UnsubscribeDate <> TARGET.UnsubscribeDate
			) THEN
		UPDATE SET
			  TARGET.FirstName = SOURCE.FirstName
			, TARGET.LastName = SOURCE.LastName
			, TARGET.Phone = SOURCE.Phone
			, TARGET.ZipCode = SOURCE.ZipCode
			, TARGET.ETL__UpdatedDate = SOURCE.ETL__UpdatedDate
			, TARGET.UnsubscribeDate = SOURCE.UnsubscribeDate
	WHEN NOT MATCHED THEN
		INSERT	( ListID
				, EmailAddress
				, SubscriptionState
				, SubscribeDate
				, SubscribeMethod
				, UnsubscribeDate
				, FirstName
				, LastName
				, Phone
				, ZipCode
				, ETL__CreatedDate
				, ETL__UpdatedDate
				)
		VALUES	( SOURCE.ListID
				, SOURCE.EmailAddress
				, SOURCE.SubscriptionState
				, SOURCE.SubscribeDate
				, SOURCE.SubscribeMethod
				, SOURCE.UnsubscribeDate
				, SOURCE.FirstName
				, SOURCE.LastName
				, SOURCE.Phone
				, SOURCE.ZipCode
				, SOURCE.ETL__CreatedDate
				, SOURCE.ETL__UpdatedDate
				);
END

-- SCA Program 348433 --
BEGIN
	MERGE ods.Listrak_SubscribedContacts AS TARGET
	USING
		(
			SELECT Email AS EmailAddress
				, CASE WHEN ISNULL([Unsubscribe Date], '') = '' THEN 'Subscribed'
					ELSE 'Unsubscribed' END AS SubscriptionState
				, [Subscribe Date (UTC-05)] AS SubscribeDate
				, Method AS SubscribeMethod
				, [Unsubscribe Date] AS UnsubscribeDate
				, [ShopperInfo FirstName] AS FirstName
				, [ShopperInfo LastName] AS LastName
				, [ShopperInfo Phone] AS Phone
				, [ShopperInfo Zip] AS ZipCode
				, ETL__CreatedDate
				, GETDATE() AS ETL__UpdatedDate
				, 348433 AS ListID
			--SELECT *
			FROM ods.Listrak_SubscribedContacts_SCAProgram
		) AS SOURCE
	ON (TARGET.ListID = SOURCE.ListID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		)
	WHEN MATCHED AND SOURCE.ETL__CreatedDate > TARGET.ETL__CreatedDate
		AND (SOURCE.FirstName <> TARGET.FirstName
			OR SOURCE.LastName <> TARGET.LastName
			OR SOURCE.Phone <> TARGET.Phone
			OR SOURCE.ZipCode <> TARGET.ZipCode
			OR SOURCE.UnsubscribeDate <> TARGET.UnsubscribeDate
			) THEN
		UPDATE SET
			  TARGET.FirstName = SOURCE.FirstName
			, TARGET.LastName = SOURCE.LastName
			, TARGET.Phone = SOURCE.Phone
			, TARGET.ZipCode = SOURCE.ZipCode
			, TARGET.ETL__UpdatedDate = SOURCE.ETL__UpdatedDate
			, TARGET.UnsubscribeDate = SOURCE.UnsubscribeDate
	WHEN NOT MATCHED THEN
		INSERT	( ListID
				, EmailAddress
				, SubscriptionState
				, SubscribeDate
				, SubscribeMethod
				, UnsubscribeDate
				, FirstName
				, LastName
				, Phone
				, ZipCode
				, ETL__CreatedDate
				, ETL__UpdatedDate
				)
		VALUES	( SOURCE.ListID
				, SOURCE.EmailAddress
				, SOURCE.SubscriptionState
				, SOURCE.SubscribeDate
				, SOURCE.SubscribeMethod
				, SOURCE.UnsubscribeDate
				, SOURCE.FirstName
				, SOURCE.LastName
				, SOURCE.Phone
				, SOURCE.ZipCode
				, SOURCE.ETL__CreatedDate
				, SOURCE.ETL__UpdatedDate
				);
END

-- TNQ 348651 --
BEGIN
	MERGE ods.Listrak_SubscribedContacts AS TARGET
	USING
		(
			SELECT Email AS EmailAddress
				, CASE WHEN ISNULL([Unsubscribe Date], '') = '' THEN 'Subscribed'
					ELSE 'Unsubscribed' END AS SubscriptionState
				, [Subscribe Date (UTC-05)] AS SubscribeDate
				, Method AS SubscribeMethod
				, [Unsubscribe Date] AS UnsubscribeDate
				, [Name First Name] AS FirstName
				, [Name Last Name] AS LastName
				, ETL__CreatedDate
				, GETDATE() AS ETL__UpdatedDate
				, 348651 AS ListID
			--SELECT *
			FROM ods.Listrak_SubscribedContacts_TNQ
		) AS SOURCE
	ON (TARGET.ListID = SOURCE.ListID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		)
	WHEN MATCHED AND SOURCE.ETL__CreatedDate > TARGET.ETL__CreatedDate
		AND (SOURCE.FirstName <> TARGET.FirstName
			OR SOURCE.LastName <> TARGET.LastName
			OR SOURCE.UnsubscribeDate <> TARGET.UnsubscribeDate
			) THEN
		UPDATE SET
			  TARGET.FirstName = SOURCE.FirstName
			, TARGET.LastName = SOURCE.LastName
			, TARGET.ETL__UpdatedDate = SOURCE.ETL__UpdatedDate
			, TARGET.UnsubscribeDate = SOURCE.UnsubscribeDate
	WHEN NOT MATCHED THEN
		INSERT	( ListID
				, EmailAddress
				, SubscriptionState
				, SubscribeDate
				, SubscribeMethod
				, UnsubscribeDate
				, FirstName
				, LastName
				, ETL__CreatedDate
				, ETL__UpdatedDate
				)
		VALUES	( SOURCE.ListID
				, SOURCE.EmailAddress
				, SOURCE.SubscriptionState
				, SOURCE.SubscribeDate
				, SOURCE.SubscribeMethod
				, SOURCE.UnsubscribeDate
				, SOURCE.FirstName
				, SOURCE.LastName
				, SOURCE.ETL__CreatedDate
				, SOURCE.ETL__UpdatedDate
				);
END





GO
