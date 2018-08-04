SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_Stage_FactTicketSales] 
( 
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000', 
	@Options NVARCHAR(MAX) = NULL 
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


SELECT fpipItemGuid, fpipItemTypeNumber, MIN(fpipPaymentDate) MinPaymentDate, MAX(fpipPaymentDate) MaxPaymentDate
INTO #PaymentDates
FROM ods.SGDW_FactProductItemPayments (NOLOCK)
GROUP BY fpipItemGuid, fpipItemTypeNumber

CREATE NONCLUSTERED INDEX IDX_item_guid ON #PaymentDates (fpipItemGuid)
CREATE NONCLUSTERED INDEX IDX_itemtype_number ON #PaymentDates (fpipItemTypeNumber)


TRUNCATE TABLE stg.SG_FactTicketSales

INSERT INTO stg.SG_FactTicketSales
( 
	  ETL__SSID, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid, ETL__SSID_SG_client_guid, ETL__SSID_SG_pricetype_guid
	, DimDateId, DimTimeId, DimTicketCustomerId, DimArenaId, DimSeasonId, DimItemId, DimEventId, DimPlanId, DimPriceLevelId, DimPriceTypeId
	, DimPriceCodeId, DimLedgerId, DimSeatId_Start, DimSeatStatusId, DimRepId, DimSalesCodeId, DimPromoId, DimEventZoneId, DimOfferId, DimPlanTypeId
	, DimTicketTypeId, DimSeatTypeId, DimTicketClassId, OrderDate, CreatedBy, UpdatedBy, CreatedDate, UpdatedDate, QtySeat, QtySeatFSE, QtySeatRenewable
	, RevenueTicket, RevenueFees, RevenueSurcharge, RevenueTax, RevenueTotal, FullPrice, Discount, PaidStatus, PaidAmount, OwedAmount, PaymentDateFirst
	, PaymentDateLast, IsSold, IsReserved, IsReturned, IsPremium, IsDiscount, IsComp, IsHost, IsPlan, IsPartial,IsSingleEvent, IsGroup, IsBroker
	, IsRenewal, IsExpanded, IsAutoRenewalNextSeason, SG_TransactNum, SG_TicketStatus, SG_IsReserved, SG_TicketNumber, SG_IsPrinted, SG_IsModifiedReservation
)


SELECT 
  ft.ftTicketGuid AS ETL__SSID
, de.ETL__SSID_SG_event_guid
, ds.ETL__SSID_SG_sector_guid
, ds.ETL__SSID_SG_seat_guid
, ft.ftClientGuid AS ETL__SSID_SG_client_guid
, dpt.ETL__SSID_SG_pricetype_guid
, ISNULL(dd.DimDateId, -1) AS DimDateId
, ISNULL(dt.DimTimeId, -1) AS DimTimeId
, ISNULL(dtc.DimTicketCustomerID, -1) AS DimTicketCustomerId
, ISNULL(de.DimArenaID, -1) AS DimArenaId
, ISNULL(de.DimSeasonId, -1) AS DimSeasonId
, ISNULL(di.DimItemId, -1) AS DimItemId
, ISNULL(de.DimEventID, -1) AS DimEventId
, ISNULL(dp.DimPlanID, -1) AS DimPlanId
, ISNULL(dpl.DimPriceLevelId, -1) AS DimPriceLevelId
, ISNULL(dpt.DimPriceTypeId, -1) AS DimPriceTypeId
, -1 AS DimPriceCodeId
, -1 AS DimLedgerId
, ISNULL(ds.DimSeatId, -1) AS DimSeatId_Start
, ISNULL(dss.DimSeatStatusId, -1) AS DimSeatStatusId
, ISNULL(dr.DimRepId, -1) AS DimRepId
, ISNULL(dsc.DimSalesCodeId, -1) AS DimSalesCodeId
, ISNULL(dpr.DimPromoId, -1) AS DimPromoId
, -1 AS DimEventZoneId
, -1 AS DimOfferId
, -1 AS DimPlanTypeId
, -1 AS DimTicketTypeId
, -1 AS DimSeatTypeId
, -1 AS DimTicketClassId
, ft.ftActualDate AS OrderDate
, SYSTEM_USER AS CreatedBy
, SYSTEM_USER AS UpdatedBy
, ft.ftActualDate AS CreatedDate
, ft.ftActualDate AS UpdatedDate
, 1 AS QtySeat
, NULL AS QtySeatFSE
, NULL AS QtySeatRenewable
, ft.ftItemPrice AS RevenueTicket
, NULL AS RevenueFees
, NULL AS RevenueSurcharge
, ft.ftTotalTax AS RevenueTax
, (ft.ftItemPrice + ft.ftTotalTax) - ft.ftTotalDiscount AS RevenueTotal
, ft.ftItemPrice AS FullPrice
, ft.ftTotalDiscount AS Discount
, CASE WHEN ft.ftItemPrice - fi.fiPaidPrice <= 0 THEN 1 ELSE 0 END AS PaidStatus
, fi.fiPaidPrice AS PaidAmount
, (ft.ftItemPrice - fi.fiPaidPrice) AS OwedAmount
, fpip.MinPaymentDate AS PaymentDateFirst
, fpip.MaxPaymentDate AS PaymentDateLast
, CASE WHEN ISNULL(ft.ftIsReserved, 0) <> 1 THEN 1 ELSE 0 END AS IsSold
, ft.ftIsReserved AS IsReserved
, NULL AS IsReturned
, NULL AS IsPremium
, CASE WHEN ft.ftTotalDiscount > 0 THEN 1 ELSE 0 END AS IsDiscount
, CASE WHEN ft.ftIsComplimentary = 1 OR dpt.PriceTypeName LIKE '%comp%' THEN 1
	ELSE 0 END AS IsComp
, 0 AS IsHost
, CASE WHEN dp.DimPlanId NOT IN (-1, 0) THEN 1 ELSE 0 END AS IsPlan
, NULL AS IsPartial
, CASE WHEN dp.DimPlanId IN (-1, 0) THEN 1 ELSE 0 END AS IsSingleEvent
, NULL AS IsGroup
, NULL AS IsBroker
, NULL AS IsRenewal
, NULL AS IsExpanded
, NULL AS IsAutoRenewalNextSeason
, ftTransactNum AS SG_TransactNum
, ft.ftTicketStatus AS SG_TicketStatus
, ft.ftIsReserved AS SG_IsReserved
, ft.ftTicketNumber AS SG_TicketNumber
, ft.ftIsPrinted AS SG_IsPrinted
, ft.ftIsModifiedReservation AS SG_IsModifiedReservation
--SELECT COUNT(*)
FROM #tkt ft (NOLOCK)
--851164
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
JOIN ods.SGDW_FactItems fi (NOLOCK)
	ON ft.ftItemGuid = fi.fiGuid
JOIN dbo.DimItem_V2 di (NOLOCK)
	ON CAST(fi.fiTypeNumber AS NVARCHAR(50)) = di.ItemCode
JOIN dbo.DimTicketCustomer_V2 dtc (NOLOCK)-- inner join means there is a client assigned to the ticket (meaning it's sold or reserved)
	ON ft.ftClientGuid = dtc.ETL__SSID_SG_client_guid
JOIN ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
	ON sien.dsieSeatIdInAreaMap = ISNULL(NULLIF(ft.ftSeatIdInAreaMap, ''), 0)
	AND sien.dsieAreaGuid = ft.ftAreaGuid
	AND sien.dsieEventGuid = ft.ftEventGuid
	AND sien.dsiePriceLevelGuid = ft.ftPriceLevelGuid
JOIN dbo.DimSeat_V2 ds (NOLOCK)
	ON sien.dsieSeatIdInAreaMap = ds.ETL__SSID_SG_SeatIdInAreaMap
	AND sien.dsieAreaMapGuid = ds.ETL__SSID_SG_areamap_guid
LEFT JOIN ods.SGDW_FactSubscriptionInstances si (NOLOCK)
	ON ft.ftSubscriptionInstanceGuid = si.fsiGuid
LEFT JOIN dbo.DimPlan_V2 dp (NOLOCK)
	ON si.fsiSeasonGuid = dp.ETL__SSID_SG_season_guid
	AND si.fsiSeriesGuid = dp.ETL__SSID_SG_series_guid
LEFT JOIN dbo.DimSalesCode_V2 dsc (NOLOCK)
	ON ft.ftSaleModeGuid = dsc.ETL__SSID_SG_salemode_guid
LEFT JOIN dbo.DimPromo_V2 dpr (NOLOCK)
	ON ft.ftCouponItemGuid = dpr.ETL__SSID_SG_promo_code
LEFT JOIN dbo.DimRep_V2 dr (NOLOCK)
	ON fi.fiSalesRepresentativeId = dr.ETL__SSID_SG_salesrep_guid
LEFT JOIN #PaymentDates fpip
	ON fi.fiGuid = fpip.fpipItemGuid
LEFT JOIN dbo.DimSeatStatus_V2 dss (NOLOCK)
	ON ft.ftRestrictionGuid = dss.ETL__SSID_SG_restriction_guid



IF OBJECT_ID('tempdb..#tkt') IS NOT NULL DROP TABLE #tkt

END 
 
 
 
 
















GO
