SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_SG_FactHeldSeats]
AS

SELECT fhs.ETL__ID, fhs.ETL__SSID, fhs.ETL__SSID_SG_ticket_guid, fhs.ETL__SSID_SG_event_guid,
	fhs.ETL__SSID_SG_sector_guid, fhs.ETL__SSID_SG_seat_guid, fhs.ETL__SSID_SG_pricetype_guid,
	fhs.DimDateId, fhs.DimTimeId, fhs.DimTicketCustomerId, fhs.DimArenaId, fhs.DimSeasonId,
	fhs.DimItemId, fhs.DimEventId, fhs.DimPlanId, fhs.DimPriceLevelId, fhs.DimPriceTypeId,
	fhs.DimPriceCodeId, fhs.DimLedgerId, fhs.DimSeatId_Start, fhs.DimSeatStatusId, fhs.DimRepId,
	fhs.DimSalesCodeId, fhs.DimPlanTypeId, fhs.DimTicketTypeId, fhs.DimSeatTypeId, fhs.DimTicketClassId,
	fhs.IsReserved, fhs.HeldDateTime, fhs.QtySeat, fhs.SubTotal, fhs.Fees, fhs.Taxes, fhs.Total,
	fhs.SG_TransactNum, fhs.SG_TicketStatus, fhs.SG_IsReserved, fhs.SG_TicketNumber,
	fhs.SG_IsPrinted, fhs.SG_IsModifiedReservation, fhs.SG_IsLocked, fhs.SG_IsSold
FROM stg.SG_FactHeldSeats fhs (NOLOCK)
GO
