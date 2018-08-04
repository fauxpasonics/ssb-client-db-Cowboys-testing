SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_LoadFactInventory_Held]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = null
)

AS
BEGIN


	UPDATE fi
	SET fi.ETL__UpdatedDate = GETUTCDATE()	
		, fi.FactHeldSeatsId = NULL
		, fi.DimSeatStatusId = 0
	FROM etl.vw_FactInventory fi
	LEFT OUTER JOIN etl.vw_FactHeldSeats fhs
		ON fi.FactHeldSeatsId = fhs.FactHeldSeatsId
	WHERE fi.FactHeldSeatsId IS NOT NULL
		AND fhs.FactHeldSeatsId IS NULL
	

	SELECT f.DimEventId, f.DimSeatId_Start DimSeatID, f.FactHeldSeatsId, f.DimSeatStatusId
	INTO #FactHeldSeats
	--SELECT COUNT(*)
	FROM etl.vw_FactHeldSeats (NOLOCK) f
	INNER JOIN etl.vw_DimEvent (NOLOCK) dEvent
		ON f.DimEventId = dEvent.DimEventId
	INNER JOIN etl.vw_DimSeat (NOLOCK) dSeat 
		ON f.DimSeatId_Start = dSeat.DimSeatID
	WHERE f.ETL__SourceSystem = 'SG'
		AND dEvent.Config_IsFactInventoryEligible = 1
		AND f.DimEventId > 0
		AND f.DimSeatId_Start > 0


	CREATE NONCLUSTERED INDEX [IDX_BusinessKey] ON #FactHeldSeats (DimEventId, DimSeatId)


	UPDATE fi
	SET fi.ETL__UpdatedDate = GETUTCDATE()	
	, fi.FactHeldSeatsId = s.FactHeldSeatsId
	, fi.DimSeatStatusId = s.DimSeatStatusId
	FROM etl.vw_FactInventory fi
	INNER JOIN #FactHeldSeats s
		ON fi.DimEventId = s.DimEventId
		AND fi.DimSeatId = s.DimSeatId
	WHERE ISNULL(fi.FactHeldSeatsId, -987) <> ISNULL(s.FactHeldSeatsId, -987)
		OR ISNULL(fi.DimSeatStatusId, -987) <> ISNULL(s.DimSeatStatusId, -987)


	DROP TABLE #FactHeldSeats


END



GO
