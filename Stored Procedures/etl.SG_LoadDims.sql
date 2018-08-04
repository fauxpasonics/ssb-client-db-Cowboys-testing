SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[SG_LoadDims]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)
AS

BEGIN 


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimArena', 'etl.vw_Load_SG_DimArena', 'ETL__SSID_SG_venue_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimSeason', 'etl.vw_Load_SG_DimSeason', 'ETL__SSID_SG_series_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimItem', 'etl.vw_Load_SG_DimItem', 'ETL__SSID_SG_itemtype_id', 'SG', @Options = @Options

	
	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimEvent', 'etl.vw_Load_SG_DimEvent', 'ETL__SSID_SG_event_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimPlan', 'etl.vw_Load_SG_DimPlan', 'ETL__SSID_SG_season_guid, ETL__SSID_SG_series_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimPromo', 'etl.vw_Load_SG_DimPromo', 'ETL__SSID_SG_promo_code', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimSalesCode', 'etl.vw_Load_SG_DimSalesCode', 'ETL__SSID_SG_salemode_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimPriceType', 'etl.vw_Load_SG_DimPriceType', 'ETL__SSID_SG_pricetype_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimPriceLevel', 'etl.vw_Load_SG_DimPriceLevel', 'ETL__SSID_SG_pricelevel_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimRep', 'etl.vw_Load_SG_DimRep', 'ETL__SSID_SG_salesrep_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimSeatStatus', 'etl.vw_Load_SG_DimSeatStatus', 'ETL__SSID_SG_restriction_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimScanGate', 'etl.vw_Load_SG_DimScanGate', 'ETL__SSID_SG_turnstile_guid', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimSeat', 'etl.vw_Load_SG_DimSeat', 'ETL__SSID_SG_seat_guid, ETL__SSID_SG_area_guid, ETL__SSID_SG_areamap_guid, ETL__SSID_SG_hall_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_venue_guid, ETL__SSID_SG_SeatIdInAreaMap', 'SG', @Options = @Options


	EXEC [etl].[SSB_StandardModelLoad] '00000000-0000-0000-0000-000000000000', 'etl.vw_DimTicketCustomer', 'etl.vw_Load_SG_DimTicketCustomer', 'ETL__SSID_SG_client_guid', 'SG', @Options = @Options


END



GO
