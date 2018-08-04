SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_Stage_FactAvailSeats] 
( 
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000', 
	@Options NVARCHAR(max) = NULL 
) 
 
AS 
BEGIN 
 

DECLARE @OptionsXML XML = TRY_CAST(@Options AS XML)

DECLARE @LoadDate DATETIME = (GETDATE() - 2)

SELECT @LoadDate = t.x.value('LoadDate[1]','DateTime')
FROM @OptionsXML.nodes('options') t(x)

PRINT @LoadDate

SELECT *
INTO #DataSet
FROM etl.vw_SGDW_FactTickets_Active ft (NOLOCK)
WHERE ft.ftClientGuid IS NULL
	AND ft.ftIsReserved = 0
	AND ft.ftBusinessDate >= @LoadDate


CREATE NONCLUSTERED INDEX IDX_event_guid ON #DataSet (ftEventGuid)
CREATE NONCLUSTERED INDEX IDX_pricetype_guid ON #DataSet (ftPriceTypeGuid)
CREATE NONCLUSTERED INDEX IDX_restriction_id ON #DataSet (ftRestrictionGuid)
CREATE NONCLUSTERED INDEX IDX_seat_guid ON #DataSet (ftSeatIdInAreaMap, ftAreaGuid)
CREATE NONCLUSTERED INDEX IDX_ticket_guid ON #DataSet (ftTicketGuid)



TRUNCATE TABLE stg.SG_FactAvailSeats

INSERT INTO stg.SG_FactAvailSeats 
(
    ETL__SSID, ETL__SSID_SG_ticket_guid, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid, ETL__SSID_SG_pricetype_guid,
	DimDateId, DimTimeId, DimArenaId, DimSeasonId, DimItemId, DimEventId, DimPlanId, DimPriceLevelId, DimPriceTypeId, DimPriceCodeId,
	DimSeatId_Start, DimSeatStatusId, DimPlanTypeId, DimTicketTypeId, DimSeatTypeId, DimTicketClassId, PostedDateTime, QtySeat, SubTotal, Fees,
	Taxes, Total, SG_TicketStatus, SG_IsLocked, SG_CountWithAvailableSeats
)


SELECT 
  CONCAT(ft.ftEventGuid, ':', ds.ETL__SSID_SG_seat_guid) AS ETL__SSID
, ft.ftTicketGuid AS ETL__SSID_SG_ticket_guid
, de.ETL__SSID_SG_event_guid
, ds.ETL__SSID_SG_sector_guid
, ds.ETL__SSID_SG_seat_guid
, dpt.ETL__SSID_SG_pricetype_guid
, ISNULL(dd.DimDateId, -1) AS DimDateId
, ISNULL(dt.DimTimeId, -1) AS DimTimeId
, ISNULL(de.DimArenaID, -1) AS DimArenaId
, ISNULL(de.DimSeasonId, -1) AS DimSeasonId
, ISNULL(di.DimItemId, -1) AS DimItemId
, ISNULL(de.DimEventID, -1) AS DimEventId
, -1 AS DimPlanId
, ISNULL(dpl.DimPriceLevelId, -1) AS DimPriceLevelId
, ISNULL(dpt.DimPriceTypeId, -1) AS DimPriceTypeId
, -1 AS DimPriceCodeId
, -1 AS DimSeatId_Start
, -1 AS DimSeatStatusId
, -1 AS DimPlanTypeId
, -1 AS DimTicketTypeId
, -1 AS DimSeatTypeId
, -1 AS DimTicketClassId
, ft.ftActualDate AS OrderDate
, 1 AS QtySeat
, ft.ftItemPrice AS Subtotal
, NULL AS Fees
, ft.ftTotalTax AS Taxes
, (ft.ftItemPrice + ft.ftTotalTax) AS Total
, ft.ftTicketStatus AS SG_TicketStatus
, CASE WHEN sien.dsieLocked > 0 THEN 1 ELSE 0 END AS SG_IsLocked
, sien.dsieIsCountWithAvailableSeats AS SG_CountWithAvailableSeats
--SELECT COUNT(*)
FROM #DataSet ft (NOLOCK)
--2660
JOIN dbo.DimEvent_V2 de
	ON ft.ftEventGuid = de.ETL__SSID_SG_event_guid
JOIN dbo.DimPriceLevel_V2 dpl (NOLOCK)
	ON ft.ftPriceLevelGuid = dpl.ETL__SSID_SG_pricelevel_guid
JOIN dbo.DimPriceType_V2 dpt (NOLOCK)
	ON ft.ftPriceTypeGuid = dpt.ETL__SSID_SG_pricetype_guid
JOIN dbo.DimDate dd (NOLOCK)
	ON dd.CalDate = ft.ftBusinessDate
JOIN dbo.DimTime dt (NOLOCK)
	ON CAST(LEFT(CAST(CAST(ft.ftActualDate AS TIME) AS NVARCHAR(100)), 8) AS TIME) = dt.Time24
JOIN ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
	ON sien.dsieSeatIdInAreaMap = ISNULL(NULLIF(ft.ftSeatIdInAreaMap, ''), 0)
	AND sien.dsieAreaGuid = ft.ftAreaGuid
	AND sien.dsieEventGuid = ft.ftEventGuid
	AND sien.dsiePriceLevelGuid = ft.ftPriceLevelGuid
JOIN dbo.DimSeat_V2 ds (NOLOCK)
	ON sien.dsieSeatIdInAreaMap = ds.ETL__SSID_SG_SeatIdInAreaMap
	AND sien.dsieAreaMapGuid = ds.ETL__SSID_SG_areamap_guid
LEFT JOIN ods.SGDW_FactItems fi (NOLOCK)
	ON ft.ftItemGuid = fi.fiGuid
LEFT JOIN dbo.DimItem_V2 di (NOLOCK)
	ON CAST(fi.fiTypeNumber AS NVARCHAR(50)) = di.ItemCode
	AND di.DimItemId <> 0
LEFT JOIN dbo.DimSeatStatus_V2 dss (NOLOCK)
	ON ft.ftRestrictionGuid = dss.ETL__SSID_SG_restriction_guid
WHERE sien.dsieIsCountWithAvailableSeats = 1


INSERT INTO stg.SG_FactAvailSeats 
(
    ETL__SSID, ETL__SSID_SG_ticket_guid, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid, ETL__SSID_SG_pricetype_guid,
	DimDateId, DimTimeId, DimArenaId, DimSeasonId, DimItemId, DimEventId, DimPlanId, DimPriceLevelId, DimPriceTypeId, DimPriceCodeId,
	DimSeatId_Start, DimSeatStatusId, DimPlanTypeId, DimTicketTypeId, DimSeatTypeId, DimTicketClassId, PostedDateTime, QtySeat, SubTotal, Fees,
	Taxes, Total, SG_TicketStatus, SG_IsLocked, SG_CountWithAvailableSeats
)

SELECT CONCAT(sien.dsieEventGuid, ':', seat.ETL__SSID_SG_seat_guid) AS ETL__SSID
	, NULL AS ETL__SSID_SG_ticket_guid
	, sien.dsieEventGuid
	, seat.ETL__SSID_SG_sector_guid
	, seat.ETL__SSID_SG_seat_guid
	, NULL AS ETL__SSID_SG_pricetype_guid
	, -1 AS DimDateID
	, -1 AS DimTimeID
	, ISNULL(e.DimArenaId, -1) AS DimArenaID
	, ISNULL(e.DimSeasonId, -1) AS DimSeasonID
	, -1 AS DimItemID
	, ISNULL(e.DimEventId, -1) AS DimEventID
	, -1 AS DimPlanID
	, ISNULL(pl.DimPriceLevelId, -1) AS DimPriceLevelID
	, -1 AS DimPriceTypeID
	, -1 AS DimPriceCodeID
	, ISNULL(seat.DimSeatId, -1) AS DimSeatID_Start
	, ISNULL(ss.DimSeatStatusId, -1) AS DimSeatStatusID
	, -1 AS DimPlanTypeID
	, -1 AS DimTicketTypeID
	, -1 AS DimSeatTypeID
	, -1 AS DimTicketClassID
	, NULL AS PostedDateTime
	, 1 AS QtySeat
	, NULL AS SubTotal
	, NULL AS Fees
	, NULL AS Taxes
	, NULL AS Total
	, NULL AS SG_TicketStatus
	, CASE WHEN sien.dsieLocked > 0 THEN 1 ELSE 0 END AS SG_IsLocked
	, sien.dsieIsCountWithAvailableSeats AS SG_CountWithAvailableSeats
FROM ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
JOIN dbo.DimSeat_V2 seat (NOLOCK)
	ON sien.dsieAreaMapGuid = seat.ETL__SSID_SG_areamap_guid
	AND sien.dsieSeatIdInAreaMap = seat.ETL__SSID_SG_SeatIdInAreaMap
JOIN dbo.DimEvent_V2 e (NOLOCK)
	ON sien.dsieEventGuid = e.ETL__SSID_SG_event_guid
JOIN dbo.DimPriceLevel_V2 pl (NOLOCK)
	ON sien.dsiePriceLevelGuid = pl.ETL__SSID_SG_pricelevel_guid
LEFT JOIN dbo.DimSeatStatus_V2 ss (NOLOCK)
	ON sien.dsieLockGuid = ss.ETL__SSID_SG_restriction_guid
LEFT JOIN #DataSet ft (NOLOCK)
	ON sien.dsieSeatIdInAreaMap = ISNULL(NULLIF(ft.ftSeatIdInAreaMap, ''), 0)
	AND sien.dsieAreaGuid = ft.ftAreaGuid
	AND sien.dsieEventGuid = ft.ftEventGuid
	AND sien.dsiePriceLevelGuid = ft.ftPriceLevelGuid
WHERE sien.dsieSold = 0
	AND sien.dsieReserved = 0
	AND sien.dsieIsCountWithAvailableSeats = 1
	AND sien.dsieIsGA = 0
	AND ft.ftTicketGuid IS NULL


DROP TABLE #DataSet

END 
 


GO
