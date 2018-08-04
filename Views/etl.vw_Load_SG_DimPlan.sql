SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [etl].[vw_Load_SG_DimPlan]
AS

SELECT DISTINCT
  CAST(p.fsiSeriesGuid AS NVARCHAR(255)) AS ETL__SSID
, CAST(p.fsiSeasonGuid AS NVARCHAR(255)) AS ETL__SSID_SG_season_guid
, CAST(p.fsiSeriesGuid AS NVARCHAR(255)) AS ETL__SSID_SG_series_guid
, series.dsrName AS PlanName
, series.dsrDescription AS PlanDesc
, season.dssName AS Season
, 1.00/NULLIF(CONVERT(DECIMAL(10,2),series.dsrQuantityOfEvents),0) AS PlanFSE
, series.dsrQuantityOfEvents AS PlanEventCnt
, ds.DimSeasonId AS DimSeasonId
--SELECT *
FROM ods.SGDW_FactSubscriptionInstances p (NOLOCK)
LEFT JOIN ods.SGDW_DimSeries series (NOLOCK)
	ON p.fsiSeriesGuid = series.dsrGuid
LEFT JOIN ods.SGDW_DimSeriesSeasons season (NOLOCK)
	ON p.fsiSeasonGuid = season.dssGuid
LEFT JOIN dbo.DimSeason_V2 ds (NOLOCK)
	ON p.fsiSeriesGuid = ds.ETL__SSID_SG_series_guid



GO
