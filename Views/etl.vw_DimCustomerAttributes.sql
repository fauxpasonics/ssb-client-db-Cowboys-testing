SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_DimCustomerAttributes]
AS

SELECT *
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
			  PersonicxLifestageClusterCode
			, PersonicxLifestageGroupsCode
			, BusinessOwner
			, SOHOIndicator
			, HomeOwnerRenter
			, PresenceOfChildren
			, HealthEnthusiastRank
			, SportsEnthusiastRank
			, Race
			, HouseholdIncome
			, NetWorth
			, ConcertGoers
			, TravelSpend
			)
		) AS PivotOutput
			


GO
