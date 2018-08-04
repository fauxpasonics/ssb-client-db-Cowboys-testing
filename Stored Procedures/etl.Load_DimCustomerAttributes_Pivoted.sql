SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[Load_DimCustomerAttributes_Pivoted]
AS


TRUNCATE TABLE dbo.DimCustomerAttributes_Pivoted

IF EXISTS (select * from sys.indexes where name = 'IDX_DimCustomerID_DimCustAttributes')
	DROP INDEX IDX_DimCustomerID_DimCustAttributes ON dbo.DimCustomerAttributes_Pivoted;

INSERT INTO dbo.DimCustomerAttributes_Pivoted (DimCustomerID, CowboysFitMemberStatus, CowboysFitAgreementNum
	, CowboysFitMembershipType, CowboysFitPrimaryMember, DCUContactMemberID, DCUMemberID, DCUMembershipType
	, DCUMemberSince, DCUContactJoinDate, DCUContactExpirationDate, DCUStore, DCUAutoPayParticipant
	, CowboysClubMemberType, StoreLocation, StoreID, PresenceOfChildren, BusinessOwner, HomeOwnerRenter
	, SOHOIndicator, PersonicxLifestageClusterCode, PersonicxLifestageGroupsCode, HealthEnthusiastRank
	, SportsEnthusiastRank, VisitType, TourPerson, TourDate, LeadSource, WeddingAnniversary, Profession
	, NetWorth, Race, ConcertGoers, TravelSpend, HouseholdIncome, ListName)

SELECT DimCustomerID, CowboysFitMemberStatus, CowboysFitAgreementNum, CowboysFitMembershipType
	, CowboysFitPrimaryMember, DCUContactMemberID, DCUMemberID, DCUMembershipType, DCUMemberSince
	, DCUContactJoinDate, DCUContactExpirationDate, DCUStore, DCUAutoPayParticipant, CowboysClubMemberType
	, StoreLocation, StoreID, PresenceOfChildren, BusinessOwner, HomeOwnerRenter, SOHOIndicator
	, PersonicxLifestageClusterCode, PersonicxLifestageGroupsCode, HealthEnthusiastRank, SportsEnthusiastRank
	, VisitType, TourPerson, TourDate, LeadSource, WeddingAnniversary, Profession, NetWorth, Race
	, ConcertGoers, TravelSpend, HouseholdIncome, ListName
FROM (
		SELECT b.DimCustomerID, c.AttributeName, c.AttributeValue
		FROM dbo.DimCustomerAttributes b (NOLOCK)
		JOIN dbo.DimCustomerAttributeValues c (NOLOCK)
			ON c.DimCustomerAttrID = b.DimCustomerAttrID
	) AS KeyValuePairs
PIVOT (
	MIN(AttributeValue)
	FOR AttributeName IN
			(
			  CowboysFitMemberStatus
			, CowboysFitAgreementNum
			, CowboysFitMembershipType
			, CowboysFitPrimaryMember
			, DCUContactMemberID
			, DCUMemberID
			, DCUMembershipType
			, DCUMemberSince
			, DCUContactJoinDate
			, DCUContactExpirationDate
			, DCUStore
			, DCUAutoPayParticipant
			, CowboysClubMemberType
			, StoreLocation
			, StoreID
			, PresenceOfChildren
			, BusinessOwner
			, HomeOwnerRenter
			, SOHOIndicator
			, PersonicxLifestageClusterCode
			, PersonicxLifestageGroupsCode
			, HealthEnthusiastRank
			, SportsEnthusiastRank
			, VisityType
			, VisitType
			, TourPerson
			, TourDate
			, LeadSource
			, WeddingAnniversary
			, Profession
			, NetWorth
			, Race
			, ConcertGoers
			, TravelSpend
			, HouseholdIncome
			, ListName
			)
		) AS PivotOutput



IF NOT EXISTS (select * from sys.indexes where name = 'IDX_DimCustomerID_DimCustAttributes')
	CREATE NONCLUSTERED INDEX IDX_DimCustomerID_DimCustAttributes on dbo.DimCustomerAttributes_Pivoted (DimCustomerID);

GO
