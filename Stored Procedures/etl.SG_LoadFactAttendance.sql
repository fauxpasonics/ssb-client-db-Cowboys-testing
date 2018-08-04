SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_LoadFactAttendance]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)

AS
BEGIN

	DECLARE @OptionsXML XML = TRY_CAST(@Options AS XML)


	DECLARE @LoadDate DATETIME = (GETDATE() - 2)

	SELECT @LoadDate = t.x.value('LoadDate[1]','DateTime')
	FROM @OptionsXML.nodes('options') t(x)

	PRINT @LoadDate
	
	SELECT ft.*, fi.fiSalesRepresentativeId, di.DimItemId
	INTO #tkt
	FROM etl.vw_SGDW_FactTickets_Active ft (NOLOCK)
	JOIN ods.SGDW_FactItems fi (NOLOCK)
		ON ft.ftItemGuid = fi.fiGuid
	JOIN dbo.DimItem_V2 di (NOLOCK)
		ON CAST(fi.fiTypeNumber AS NVARCHAR(50)) = di.ItemCode
	WHERE ISNULL(di.Config_IsFactSalesEligible,1) = 1
		AND ISNULL(di.Config_IsClosed,0) = 0
		AND ft.ftIsReserved = 0
		AND ft.ftClientGuid IS NOT NULL
		AND ft.ftBusinessDate >= @LoadDate


	CREATE NONCLUSTERED INDEX IDX_event_guid ON #tkt (ftEventGuid)
	CREATE NONCLUSTERED INDEX IDX_subscriptioninstance_guid ON #tkt (ftSubscriptionInstanceGuid)
	CREATE NONCLUSTERED INDEX IDX_client_guid ON #tkt (ftClientGuid)
	CREATE NONCLUSTERED INDEX IDX_salesrep_guid ON #tkt (fiSalesRepresentativeId)
	CREATE NONCLUSTERED INDEX IDX_restriction_guid ON #tkt (ftRestrictionGuid)
	CREATE NONCLUSTERED INDEX IDX_pricelevel_guid ON #tkt (ftPriceLevelGuid)
	CREATE NONCLUSTERED INDEX IDX_coupon_guid ON #tkt (ftCouponItemGuid)
	CREATE NONCLUSTERED INDEX IDX_pricetype_guid ON #tkt (ftPriceTypeGuid)
	CREATE NONCLUSTERED INDEX IDX_seat_guid ON #tkt (ftSeatIdInAreaMap, ftAreaGuid)



	SELECT
		  ft.ftTicketGuid ETL__SSID
		, ISNULL(de.DimArenaId, -1) AS DimArenaId
		, ISNULL(de.DimSeasonId, -1) AS DimSeasonId
		, ISNULL(de.DimEventId, -1) AS DimEventId
		, ISNULL(dtc.DimTicketCustomerId, -1) DimTicketCustomerId
		, ISNULL(dtcScan.DimTicketCustomerId, -1) AS DimTicketCustomerId_Attended
		, ISNULL(ds.DimSeatId, -1) AS DimSeatId
		, CONVERT(VARCHAR, bc.fbScanDate, 112) AS DimDateId
		, DATEDIFF(SECOND, CAST(bc.fbScanDate AS DATE), bc.fbScanDate) DimTimeId
		, ISNULL(sg.DimScanGateId, -1) DimScanGateId
		, -1 AS DimScanTypeId
		, bc.fbScanSucceeded ScanCount
		, 0 ScanCountFailed
		, bc.fbScanDate ScanDateTime		
		, CAST(bc.fbBarcode AS NVARCHAR(255)) Barcode
		, bc.fbIsVirtualScan IsMobile
		, ft.ftEventGuid ETL__SSID_SG_event_guid
		, bc.fbClientGuid ETL__SSID_SG_client_guid
		, ds.ETL__SSID_SG_sector_guid ETL__SSID_SG_sector_guid
		, ds.ETL__SSID_SG_seat_guid ETL__SSID_SG_seat_guid
		, 'SG' ETL__SourceSystem
		, GETDATE() ETL__CreatedDate
		, GETDATE() ETL__UpdatedDate
	INTO #AttendSG
	--SELECT COUNT(*)
	FROM #Tkt ft (NOLOCK)
	--851164
	JOIN dbo.DimEvent_V2 de (NOLOCK)
		ON ft.ftEventGuid = de.ETL__SSID_SG_event_guid
	JOIN dbo.DimTicketCustomer_V2 dtc (NOLOCK)
		ON ft.ftClientGuid = dtc.ETL__SSID_SG_client_guid
	JOIN ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
		ON sien.dsieSeatIdInAreaMap = ISNULL(NULLIF(ft.ftSeatIdInAreaMap, ''), 0)
		AND sien.dsieAreaGuid = ft.ftAreaGuid
		AND sien.dsieEventGuid = ft.ftEventGuid
		AND sien.dsiePriceLevelGuid = ft.ftPriceLevelGuid
	JOIN dbo.DimSeat_V2 ds (NOLOCK)
		ON sien.dsieSeatIdInAreaMap = ds.ETL__SSID_SG_SeatIdInAreaMap
		AND sien.dsieAreaMapGuid = ds.ETL__SSID_SG_areamap_guid
	JOIN ods.SGDW_FactBarcodes bc  (NOLOCK)
		ON ft.ftTicketGuid = bc.fbTicketGuid
	JOIN dbo.DimTicketCustomer_V2 dtcScan (NOLOCK)
		ON bc.fbClientGuid = dtcScan.ETL__SSID_SG_client_guid
	JOIN ods.SGDW_DimTurnstiles turn (NOLOCK)
		ON bc.fbTurnstileGuid = turn.dtsGuid
	JOIN dbo.DimScanGate_V2 sg (NOLOCK)
		ON sg.ETL__SSID_SG_turnstile_guid = bc.fbTurnstileGuid

	CREATE NONCLUSTERED INDEX IDX_LoadKey ON #AttendSG (DimEventId, DimSeatId)


	INSERT INTO etl.vw_FactAttendance 
	(
		DimArenaId, DimSeasonId, DimEventId, DimTicketCustomerId, DimTicketCustomerId_Attended, DimSeatId, DimDateId, DimTimeId, DimScanGateId, DimScanTypeId, ScanCount, ScanCountFailed, ScanDateTime, Barcode, IsMobile
		, ETL__SSID_SG_event_guid, ETL__SSID_SG_client_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid, ETL__SourceSystem, ETL__CreatedDate, ETL__UpdatedDate, ETL__SSID
	)
	SELECT 
		a.DimArenaId, a.DimSeasonId, a.DimEventId, a.DimTicketCustomerId, a.DimTicketCustomerId_Attended, a.DimSeatId, a.DimDateId, a.DimTimeId, a.DimScanGateId, a.DimScanTypeid, a.ScanCount, a.ScanCountFailed, a.ScanDateTime, a.Barcode, a.IsMobile
		, a.ETL__SSID_SG_event_guid, a.ETL__SSID_SG_client_guid, a.ETL__SSID_SG_sector_guid, a.ETL__SSID_SG_seat_guid, a.ETL__SourceSystem, a.ETL__CreatedDate, a.ETL__UpdatedDate, a.ETL__SSID
	FROM #AttendSG a
	LEFT OUTER JOIN etl.vw_FactAttendance f
		ON f.DimEventId = a.DimEventId
		AND f.DimSeatId = a.DimSeatId 
	WHERE f.FactAttendanceId IS NULL


	UPDATE fi
	SET fi.ETL__UpdatedDate = GETDATE()
	, fi.FactAttendanceId = fa.FactAttendanceId
	FROM etl.vw_FactInventory fi
	INNER JOIN etl.vw_FactAttendance fa
		ON fi.DimEventId = fa.DimEventId
		AND fi.DimSeatId = fa.DimSeatId
	WHERE ISNULL(fi.FactAttendanceId, -987) <> ISNULL(fa.FactAttendanceId, -987)


END



GO
