SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_SG_Manifests]
AS

SELECT v.dvGuid AS SSID_SG_venue_guid
	, h.dhGuid AS SSID_SG_hall_guid
	, hv.dhvGuid AS SSID_SG_hallversion_guid
	, am.damAreaGuid AS SSID_SG_area_guid
	, hvam.dhaAreaMapGuid AS SSID_SG_areamap_guid
	, a.daStandGuid AS SSID_SG_stand_guid
	, si.dsiSectorGuid AS SSID_SG_sector_guid
	, si.dsiGuid AS SSID_SG_seat_guid
	, v.dvName AS VenueName
	, v.dvTimeZoneId AS TimeZone
	, h.dhIsActive HallIsActive
	, h.dhName HallName
	, hv.dhvName HallVersionName
	, a.daName AS AreaName
	, am.damName AS AreaMapName
	, s.dstName AS StandName
	, si.dsiSectorName
	, si.dsiRowName
	, si.dsiSeatName
	, si.dsiSeatCustom1
--	, si.dsiSeatIdInAreaMap
--	, am.damSeatIds
--SELECT *
FROM ods.SGDW_DimHalls h (NOLOCK)
JOIN ods.SGDW_DimHallVersions hv (NOLOCK)
	ON h.dhGuid = hv.dhvHallGuid
JOIN ods.SGDW_DimHallVersionsAreaMaps hvam (NOLOCK)
	ON hv.dhvGuid = hvam.dhaHallVersionGuid
JOIN ods.SGDW_DimAreaMaps am (NOLOCK)
	ON hvam.dhaAreaMapGuid = am.damGuid
JOIN ods.SGDW_DimAreas a (NOLOCK)
	ON am.damAreaGuid = a.daGuid
JOIN ods.SGDW_DimVenues v (NOLOCK)
	ON h.dhVenueGuid = v.dvGuid
JOIN ods.SGDW_DimStands s (NOLOCK)
	ON a.daStandGuid = s.dstGuid
JOIN ods.SGDW_DimSeatsInfo si (NOLOCK)
	ON si.dsiAreaMapGuid = am.damGuid
--ORDER BY VenueName, HallName, HallVersionName, AreaName, AreaMapName
--	, StandName, si.dsiSectorName, si.dsiRowName, si.dsiSeatName
GO
