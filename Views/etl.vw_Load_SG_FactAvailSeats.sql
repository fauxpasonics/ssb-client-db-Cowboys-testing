SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_SG_FactAvailSeats]
AS

SELECT fas.ETL__ID, fas.ETL__SSID, fas.ETL__SSID_SG_ticket_guid, fas.ETL__SSID_SG_event_guid
	, fas.ETL__SSID_SG_sector_guid, fas.ETL__SSID_SG_seat_guid, fas.ETL__SSID_SG_pricetype_guid
	, fas.DimDateId, fas.DimTimeId, fas.DimArenaId, fas.DimSeasonId, fas.DimItemId, fas.DimEventId
	, fas.DimPlanId, fas.DimPriceLevelId, fas.DimPriceTypeId, fas.DimPriceCodeId, fas.DimSeatId_Start
	, fas.DimSeatStatusId, fas.DimPlanTypeId, fas.DimTicketTypeId, fas.DimSeatTypeId, fas.DimTicketClassId
	, fas.PostedDateTime, fas.QtySeat, fas.SubTotal, fas.Fees, fas.Taxes, fas.Total, fas.SG_IsLocked
	, fas.SG_CountWithAvailableSeats, fas.SG_TicketStatus
FROM stg.SG_FactAvailSeats fas (NOLOCK)


GO
