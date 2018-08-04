SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_SG_DimEvent]
AS

SELECT 
  e.devGuid AS ETL__SSID
, e.devGuid AS ETL__SSID_SG_event_guid
, xse.xseSeriesGuid AS ETL__SSID_SG_series_guid
, e.devGlobalName AS EventName
, s.dshName AS EventDesc
, st.dstName AS EventClass
, CAST(e.devEventActualDate AS DATE) AS EventDate
, CAST(e.devEventActualDate AS TIME) AS EventTime
, CAST(e.devEventActualDate AS DATETIME) AS EventDateTime
, da.ArenaName AS Arena
, ds.SeasonName AS Season
, e.devHallVersionGuid AS SG_hallversion_guid
, hall.dhGuid AS SG_hall_guid
, hall.dhVenueGuid AS SG_venue_guid
, et.detName AS EventType
, da.DimArenaId AS DimArenaID
, ds.DimSeasonId AS DimSeasonId
-- SELECT COUNT(*)
FROM ods.SGDW_DimEvents e (NOLOCK)
LEFT JOIN ods.SGDW_DimEventTypes et (NOLOCK)
	ON e.devEventTypeGuid = et.detGuid
LEFT JOIN ods.SGDW_DimShows s (NOLOCK)
	ON e.devShowGuid = s.dshGuid
LEFT JOIN ods.SGDW_DimShowTypes st (NOLOCK)
	ON s.dshShowTypeGuid = st.dstGuid
LEFT JOIN ods.SGDW_DimHallVersions hallver (NOLOCK)
	ON e.devHallVersionGuid = hallver.dhvGuid
LEFT JOIN ods.SGDW_DimHalls hall (NOLOCK)
	ON hallver.dhvHallGuid = hall.dhGuid
LEFT JOIN ods.SGDW_XrefSeriesEvents xse (NOLOCK)
	ON e.devGuid = xse.xseEventGuid
LEFT JOIN dbo.DimArena_V2 da (NOLOCK)
	ON hall.dhVenueGuid = da.ETL__SSID_SG_venue_guid
LEFT JOIN dbo.DimSeason_V2 ds (NOLOCK)
	ON xse.xseSeriesGuid = ds.ETL__SSID_SG_series_guid
GO
