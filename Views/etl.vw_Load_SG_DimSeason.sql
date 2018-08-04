SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_SG_DimSeason]
AS

SELECT
  s.dsrGuid AS ETL__SSID
, s.dsrGuid AS ETL__SSID_SG_series_guid
, s.dsrName AS SeasonName
, s.dsrDescription AS SeasonDesc
, ssc.dscName AS SeasonClass
, s.dsrIsActive AS IsActive
, sse.dssName AS SeasonYear
, s.dsrQuantityOfEvents AS SeasonEventCntFSE
, h.dhVenueGuid AS SG_venue_guid
, s.dsrHallGuid AS SG_hall_guid
, s.dsrHallVersionGuid AS SG_hallversion_guid
, da.DimArenaId AS DimArenaId
, da.ArenaName AS Arena
--SELECT *
FROM ods.SGDW_DimSeries s (NOLOCK)
LEFT JOIN ods.SGDW_DimSeriesSchemes ssc (NOLOCK)
	ON s.dsrSchemeGuid = ssc.dscGuid
LEFT JOIN ods.SGDW_DimSeriesSeasons sse (NOLOCK)
	ON s.dsrSeasonGuid = sse.dssGuid
LEFT JOIN ods.SGDW_DimHalls h (NOLOCK)
	ON s.dsrHallGuid = h.dhGuid
LEFT JOIN dbo.DimArena_V2 da (NOLOCK)
	ON h.dhVenueGuid = da.ETL__SSID_SG_venue_guid
GO
