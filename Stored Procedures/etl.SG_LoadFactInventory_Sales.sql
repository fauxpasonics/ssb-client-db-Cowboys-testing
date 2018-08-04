SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_LoadFactInventory_Sales]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)

AS
BEGIN

	UPDATE fi
	SET fi.ETL__UpdatedDate = GETUTCDATE()	
	, fi.FactTicketSalesId = NULL
	, fi.DimSeatStatusId = 0
	FROM etl.vw_FactInventory fi
	LEFT OUTER JOIN etl.vw_FactTicketSales (NOLOCK) fts
		ON fi.FactTicketSalesId = fts.FactTicketSalesId
	WHERE fi.FactTicketSalesId IS NOT NULL
	AND fts.FactTicketSalesId IS NULL

	
	DECLARE @SoldDimSeatStatusId INT 

	SELECT @SoldDimSeatStatusId = DimSeatStatusId
	FROM etl.vw_DimSeatStatus
	WHERE ETL__SSID = 'CI Default: SOLD'
	

	SELECT dEvent.DimArenaId, dEvent.DimSeasonId, f.DimEventId, dSeat.DimSeatId, f.FactTicketSalesId, @SoldDimSeatStatusId DimSeatStatusid
		, dEvent.ETL__SSID_SG_event_guid, dSeat.ETL__SSID_SG_sector_guid, dSeat.ETL__SSID_SG_seat_guid
	INTO #FactTicketSales
	--SELECT COUNT(*)
	FROM etl.vw_FactTicketSales (NOLOCK) f
	INNER JOIN etl.vw_DimEvent (NOLOCK) dEvent
		ON f.DimEventId = dEvent.DimEventId
	INNER JOIN etl.vw_DimSeat (NOLOCK) dSeat 
		ON f.DimSeatId_Start = dSeat.DimSeatId

	WHERE dEvent.Config_IsFactInventoryEligible = 1
	AND f.ETL__UpdatedDate > (GETDATE() - 2)

	CREATE NONCLUSTERED INDEX [IDX_BusinessKey] ON #FactTicketSales (DimEventId, DimSeatId)


MERGE etl.vw_FactInventory AS TARGET
USING
	(
		SELECT DimArenaId, DimSeasonId, DimEventId, DimSeatId, FactTicketSalesId, ISNULL(DimSeatStatusid, -1) DimSeatStatusID
			, ETL__SSID_SG_event_guid, ETL__SSID_SG_sector_guid, ETL__SSID_SG_seat_guid
		FROM #FactTicketSales (NOLOCK)
	) AS SOURCE
ON	(TARGET.DimEventId = SOURCE.DimEventId
	 AND TARGET.DimSeatId = SOURCE.DimSeatId
	 )
WHEN MATCHED AND (ISNULL(TARGET.DimSeatStatusId, -987) <> ISNULL(SOURCE.DimSeatStatusId, -987)
		OR ISNULL(TARGET.FactTicketSalesId, -987) <> ISNULL(SOURCE.FactTicketSalesId, -987)
	) THEN
	UPDATE SET
		  TARGET.ETL__UpdatedDate = GETUTCDATE()
		, TARGET.DimSeatStatusid = SOURCE.DimSeatStatusid
		, TARGET.FactTicketSalesId = SOURCE.FactTicketSalesId
WHEN NOT MATCHED
	THEN
	INSERT	( ETL__SourceSystem
			, ETL__CreatedBy
			, ETL__CreatedDate
			, ETL__UpdatedDate
			, ETL__SSID_SG_event_guid
			, ETL__SSID_SG_sector_guid
			, ETL__SSID_SG_seat_guid
			, DimArenaId
			, DimSeasonId
			, DimEventId
			, DimSeatId
			, DimSeatStatusid
			)
	VALUES	( 'SG'
			, SUSER_NAME()
			, GETUTCDATE()
			, GETUTCDATE()
			, SOURCE.ETL__SSID_SG_event_guid
			, SOURCE.ETL__SSID_SG_sector_guid
			, SOURCE.ETL__SSID_SG_seat_guid
			, SOURCE.DimArenaId
			, SOURCE.DimSeasonId
			, SOURCE.DimEventId
			, SOURCE.DimSeatId
			, SOURCE.DimSeatStatusid
			);



	DROP TABLE #FactTicketSales

END





GO
