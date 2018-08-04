SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_LoadFactInventory_Seats]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)

AS
BEGIN


SELECT DISTINCT e.ETL__SourceSystem, e.DimEventId, s.DimSeatId, e.DimSeasonId, e.DimArenaId
	, sien.*, e.Config_IsFactInventoryEligible
INTO #NonGASeats
FROM ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
JOIN etl.vw_DimEvent e (NOLOCK)
	ON sien.dsieEventGuid = e.ETL__SSID_SG_event_guid
	AND e.ETL__SourceSystem = 'SG'
JOIN etl.vw_DimSeat s
	ON sien.dsieSeatIdInAreaMap = s.ETL__SSID_SG_SeatIdInAreaMap
	AND sien.dsieAreaMapGuid = s.ETL__SSID_SG_areamap_guid
	AND sien.dsieAreaGuid = s.ETL__SSID_SG_area_guid
	AND s.ETL__SourceSystem = 'SG'
WHERE ISNULL(sien.dsieIsGA, 0) = 0
	AND e.Config_IsFactInventoryEligible = 1


CREATE NONCLUSTERED INDEX IDX_DimEventID ON #NonGASeats (DimEventId)
CREATE NONCLUSTERED INDEX IDX_DimSeatID ON #NonGASeats (DimSeatId)


INSERT INTO etl.vw_FactInventory 
(
	ETL__SourceSystem, ETL__CreatedBy, ETL__CreatedDate, ETL__UpdatedDate
	, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid
	, DimArenaId, DimSeasonId, DimEventId, DimSeatId, DimSeatStatusid
)

SELECT 
	seats.ETL__SourceSystem
	, SUSER_NAME() ETL__CreatedBy, GETUTCDATE() ETL__CreatedDate, GETUTCDATE() ETL__UpdatedDate
	, seats.dsieEventGuid, dSeat.ETL__SSID_SG_sector_guid , dSeat.ETL__SSID_SG_seat_guid
	, ISNULL(seats.DimArenaId, -1) DimArenaId, ISNULL(seats.DimSeasonId, -1) DimSeasonId
	, ISNULL(seats.DimEventId, -1) DimEventId, ISNULL(seats.DimSeatId, -1) DimSeatId
	, -1 DimSeatStatusid
--SELECT COUNT(*)
FROM #NonGASeats seats (NOLOCK)
JOIN etl.vw_DimSeat dSeat
	ON seats.DimSeatId = dSeat.DimSeatId
LEFT JOIN etl.vw_FactInventory fi
	ON fi.DimEventId = seats.DimEventId
	AND fi.DimSeatId = seats.DimSeatId
WHERE 1=1			
	AND ISNULL(dSeat.Config_IsFactInventoryEligible,1) <> 0
	AND fi.FactInventoryId IS NULL						
ORDER BY
	ISNULL(seats.DimEventId, -1), ISNULL(seats.DimSeatId, -1)


END



GO
