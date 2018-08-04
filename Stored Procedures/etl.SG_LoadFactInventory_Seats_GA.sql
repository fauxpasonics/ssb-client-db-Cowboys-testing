SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_LoadFactInventory_Seats_GA]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)

AS
BEGIN


SELECT e.ETL__SourceSystem, e.DimEventId, -1 DimSeatID, e.DimSeasonId, e.DimArenaId
	, e.Config_IsFactInventoryEligible, sien.dsieEventGuid, sien.dsieAreaGuid, sien.dsieSeatIdInAreaMap
	, SUM(sien.dsieCapacity) Capacity
INTO #GASeats
FROM ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
JOIN etl.vw_DimEvent e (NOLOCK)
	ON sien.dsieEventGuid = e.ETL__SSID_SG_event_guid
	AND e.ETL__SourceSystem = 'SG'
WHERE ISNULL(sien.dsieIsGA, 0) = 1
	AND e.Config_IsFactInventoryEligible = 1
	AND sien.dsieIsCountWithAvailableSeats = 1
GROUP BY e.ETL__SourceSystem, e.DimEventId, e.DimSeasonId, e.DimArenaId, e.Config_IsFactInventoryEligible
	, sien.dsieEventGuid, sien.dsieAreaGuid, sien.dsieSeatIdInAreaMap


CREATE NONCLUSTERED INDEX IDX_DimEventID ON #GASeats (DimEventId)
CREATE NONCLUSTERED INDEX IDX_guids ON #GASeats (dsieEventGuid, dsieAreaGuid)

SELECT DimEventId, COUNT(*) RecordCount
INTO #InventoryCount
FROM etl.vw_FactInventory
GROUP BY DimEventId


INSERT INTO etl.vw_FactInventory 
(
	ETL__SourceSystem, ETL__CreatedBy, ETL__CreatedDate, ETL__UpdatedDate
	, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid
	, DimArenaId, DimSeasonId, DimEventId, DimSeatId, DimSeatStatusid
)

SELECT 
	seats.ETL__SourceSystem
	, SUSER_NAME() ETL__CreatedBy, GETUTCDATE() ETL__CreatedDate, GETUTCDATE() ETL__UpdatedDate
	, seats.dsieEventGuid, NULL AS ETL__SSID_SG_sector_guid , NULL AS ETL__SSID_SG_seat_guid
	, ISNULL(seats.DimArenaId, -1) DimArenaId, ISNULL(seats.DimSeasonId, -1) DimSeasonId
	, ISNULL(seats.DimEventId, -1) DimEventId, ISNULL(seats.DimSeatId, -1) DimSeatId
	, -1 DimSeatStatusid
--SELECT COUNT(*)
FROM #GASeats seats (NOLOCK)
LEFT JOIN #InventoryCount inv (NOLOCK)
	ON seats.DimEventId = inv.DimEventId
LEFT JOIN etl.GA_SeatLookup lkp (NOLOCK)
	ON lkp.Capacity BETWEEN (seats.Capacity - inv.RecordCount) AND seats.Capacity
WHERE 1=1								
ORDER BY
	ISNULL(seats.DimEventId, -1), ISNULL(seats.DimSeatId, -1)


END



GO
