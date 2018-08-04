SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [segmentation].[vw_Contact_Attributes]
AS

SELECT cr.SSB_CRMSYSTEM_CONTACT_ID
	, CASE WHEN ISNULL(cr.AddressPrimaryLatitude, '') <> '' AND ISNULL(cr.AddressPrimaryLongitude, '') <> ''
		THEN geography::Point(cr.AddressPrimaryLatitude, cr.AddressPrimaryLongitude, 4326).STDistance(geography::Point(dist_att.Latitude, dist_att.Longitude, 4326)) / 1609.344
		END AS Distance_From_ATT_Stadium
	, CASE WHEN ISNULL(cr.AddressPrimaryLatitude, '') <> '' AND ISNULL(cr.AddressPrimaryLongitude, '') <> ''
		THEN geography::Point(cr.AddressPrimaryLatitude, cr.AddressPrimaryLongitude, 4326).STDistance(geography::Point(dist_star.Latitude, dist_star.Longitude, 4326)) / 1609.344
		END AS Distance_From_The_Star
	, MAX(CASE WHEN ssbid.SourceSystem = 'Listrak' THEN 1 ELSE 0 END) AS InListrak
	, MAX(CASE WHEN ssbid.SourceSystem = 'CowboysFit' THEN 1 ELSE 0 END) AS InCowboysFit
	, MAX(CASE WHEN ssbid.SourceSystem = 'YouthCamps' THEN 1 ELSE 0 END) AS InYouthCamps
	, MAX(CASE WHEN ssbid.SourceSystem = 'CRM_Contact' THEN 1 ELSE 0 END) AS InCRM_Contact
	, MAX(CASE WHEN ssbid.SourceSystem = 'FanManager' THEN 1 ELSE 0 END) AS InFanManager
	, MAX(CASE WHEN ssbid.SourceSystem = 'TM' THEN 1 ELSE 0 END) AS InTM
	, MAX(CASE WHEN ssbid.SourceSystem = 'CowboysClub' THEN 1 ELSE 0 END) AS InCowboysClub
	, MAX(CASE WHEN ssbid.SourceSystem = 'CowboysEntity' THEN 1 ELSE 0 END) AS InCowboysEntity
	, MAX(CASE WHEN ssbid.SourceSystem = 'CRM_Account' THEN 1 ELSE 0 END) AS InCRM_Account
	, MAX(CASE WHEN ssbid.SourceSystem = 'CowboysFanClub' THEN 1 ELSE 0 END) AS InCowboysFanClub
--SELECT cr.DimCustomerId, dist_att.*, dist_star.*	
FROM mdm.CompositeRecord cr
JOIN ods.Distances dist_att
	ON dist_att.[Location] = 'AT&T Stadium'
JOIN ods.Distances dist_star
	ON dist_star.[Location] = 'The Star in Frisco'
JOIN dbo.dimcustomerssbid ssbid
	ON cr.SSB_CRMSYSTEM_CONTACT_ID = ssbid.SSB_CRMSYSTEM_CONTACT_ID
GROUP BY cr.SSB_CRMSYSTEM_CONTACT_ID
	, CASE WHEN ISNULL(cr.AddressPrimaryLatitude, '') <> '' AND ISNULL(cr.AddressPrimaryLongitude, '') <> ''
		THEN geography::Point(cr.AddressPrimaryLatitude, cr.AddressPrimaryLongitude, 4326).STDistance(geography::Point(dist_att.Latitude, dist_att.Longitude, 4326)) / 1609.344
		END
	, CASE WHEN ISNULL(cr.AddressPrimaryLatitude, '') <> '' AND ISNULL(cr.AddressPrimaryLongitude, '') <> ''
		THEN geography::Point(cr.AddressPrimaryLatitude, cr.AddressPrimaryLongitude, 4326).STDistance(geography::Point(dist_star.Latitude, dist_star.Longitude, 4326)) / 1609.344
		END


GO
