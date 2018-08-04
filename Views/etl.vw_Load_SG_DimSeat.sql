SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_SG_DimSeat]
AS

SELECT
  CAST(si.dsiGuid AS NVARCHAR(255)) AS ETL__SSID
, CAST(am.damAreaGuid AS NVARCHAR(255)) AS ETL__SSID_SG_area_guid
, CAST(si.dsiAreaMapGuid AS NVARCHAR(255)) AS ETL__SSID_SG_areamap_guid
, CAST(st.dstHallGuid AS NVARCHAR(255)) AS ETL__SSID_SG_hall_guid
, CAST(si.dsiSectorGuid AS NVARCHAR(255)) AS ETL__SSID_SG_sector_guid
, CAST(si.dsiGuid AS NVARCHAR(255)) AS ETL__SSID_SG_seat_guid
, CAST(v.dvGuid AS NVARCHAR(255)) AS ETL__SSID_SG_venue_guid
, si.dsiSeatIdInAreaMap AS ETL__SSID_SG_SeatIdInAreaMap
, NULL AS Season
, st.dstName AS LevelName
, si.dsiSectorName AS SectionName
, si.dsiRowName AS RowName
, si.dsiSeatName AS Seat
, st.dstDescription AS LevelDesc
, si.dsiSeatCustom1 AS SectionDesc
, NULL AS RowDesc
--SELECT COUNT(*)
FROM ods.SGDW_DimSeatsInfo si (NOLOCK)
LEFT JOIN ods.SGDW_DimAreaMaps am (NOLOCK)
	ON si.dsiAreaMapGuid = am.damGuid
LEFT JOIN ods.SGDW_DimAreas a (NOLOCK)
	ON am.damAreaGuid = a.daGuid
LEFT JOIN ods.SGDW_DimStands st (NOLOCK)
	ON a.daStandGuid = st.dstGuid
LEFT JOIN ods.SGDW_DimHalls h (NOLOCK)
	ON a.daHallGuid = h.dhGuid
LEFT JOIN ods.SGDW_DimVenues v (NOLOCK)
	ON h.dhVenueGuid = v.dvGuid
GO
