SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [etl].[vw_Load_SG_FactTicketSales] AS (

	SELECT  
		ETL__SSID, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid, ETL__SSID_SG_client_guid, ETL__SSID_SG_pricetype_guid,
		DimDateId, DimTimeId, DimTicketCustomerId, DimArenaId, DimSeasonId, DimItemId, DimEventId, DimPlanId, DimPriceLevelId, DimPriceTypeId,
		DimPriceCodeId, DimLedgerId, DimSeatId_Start, DimSeatStatusId, DimRepId, DimSalesCodeId, DimPromoId, DimEventZoneId, DimOfferId, DimPlanTypeId,
		DimTicketTypeId, DimSeatTypeId, DimTicketClassId, OrderDate, CreatedBy, UpdatedBy, CreatedDate, UpdatedDate, QtySeat, QtySeatFSE, QtySeatRenewable,
		RevenueTicket, RevenueFees, RevenueSurcharge, RevenueTax, RevenueTotal, FullPrice, Discount, PaidStatus, PaidAmount, OwedAmount, PaymentDateFirst,
		PaymentDateLast, IsSold, IsReserved, IsReturned, IsPremium, IsDiscount, IsComp, IsHost, IsPlan, IsPartial, IsSingleEvent, IsGroup, IsBroker,
		IsRenewal, IsExpanded, IsAutoRenewalNextSeason, SG_TransactNum, SG_TicketStatus, SG_IsReserved, SG_TicketNumber, SG_IsPrinted, SG_IsModifiedReservation,
		Custom_Int_1, Custom_Int_2, Custom_Int_3, Custom_Int_4, Custom_Int_5,	Custom_Dec_1, Custom_Dec_2, Custom_Dec_3, Custom_Dec_4, Custom_Dec_5,
		Custom_DateTime_1, Custom_DateTime_2, Custom_DateTime_3, Custom_DateTime_4, Custom_DateTime_5, Custom_Bit_1, Custom_Bit_2, Custom_Bit_3, Custom_Bit_4,
		Custom_Bit_5, Custom_nVarChar_1, Custom_nVarChar_2, Custom_nVarChar_3, Custom_nVarChar_4, Custom_nVarChar_5

	FROM stg.SG_FactTicketSales (NOLOCK)

)




GO
