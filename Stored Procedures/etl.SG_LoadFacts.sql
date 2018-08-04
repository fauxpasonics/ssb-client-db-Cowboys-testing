SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[SG_LoadFacts]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS 
BEGIN

	SELECT 'Start...', GETDATE() ts


	--EXEC [etl].[TM_ResetOverlappingSeatBlocks] @BatchId = @BatchId, @Options = @Options
	--EXEC etl.TM_FactTicketSales_DeleteReturns @BatchId = @BatchId, @Options = @Options


	SELECT 'Step 2...', GETDATE() ts
	

	--DECLARE @Options NVARCHAR(MAX) = '<options><LoadDate>1900-01-01</LoadDate></options>' DECLARE @BatchID UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000'
	EXEC etl.SG_Stage_FactTicketSales @BatchId = @BatchId, @Options = @Options


	SELECT 'Step 3...', GETDATE() ts


	IF EXISTS (SELECT * FROM sys.procedures WHERE [object_id] = OBJECT_ID('etl.Cust_FactTicketSalesProcessing_SG'))
	BEGIN		
		EXEC etl.Cust_FactTicketSalesProcessing_SG @BatchId = @BatchId, @Options = @Options
	END


	SELECT 'Step 4...', GETDATE() ts	


	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactTicketSales', @Source = 'etl.vw_Load_SG_FactTicketSales', @BusinessKey = 'ETL__SSID', @SourceSystem = 'SG', @Options = @Options


	SELECT 'Step 5...', GETDATE() ts	
	

	/*	When we have secondary data available through SeatGeek we can go ahead and add these*/
	--EXEC [etl].[TM_Stage_FactTicketActivity] @BatchId = @BatchId, @Options = @Options
	--EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactTicketActivity', @Source = 'etl.vw_Load_TM_FactTicketActivity', @BusinessKey = 'ETL__SSID_TM_ods_id', @SourceSystem = 'TM'


	EXEC [etl].[SG_Stage_FactHeldSeats] @BatchId = @BatchId, @Options = @Options
	

	DELETE t
	FROM etl.vw_FactHeldSeats t
	LEFT JOIN (
			SELECT DISTINCT ft.ftTicketGuid
			FROM etl.vw_SGDW_FactTickets_Active ft (NOLOCK)
			WHERE ft.ftIsReserved = 1
		) s ON t.ETL__SSID_SG_ticket_guid = s.ftTicketGuid
	WHERE s.ftTicketGuid IS NULL


	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactHeldSeats', @Source = 'etl.vw_Load_SG_FactHeldSeats'
	, @BusinessKey = 'ETL__SSID_SG_ticket_guid', @SourceSystem = 'SG'


	EXEC [etl].[SG_Stage_FactAvailSeats] @BatchId = @BatchId, @Options = @Options


	DELETE t
	FROM etl.vw_FactAvailSeats t
	LEFT JOIN (
			SELECT DISTINCT ft.ftTicketGuid
			FROM etl.vw_SGDW_FactTickets_Active ft (NOLOCK)
			WHERE ft.ftIsReserved = 0 AND ft.ftClientGuid IS NULL
		) s ON t.ETL__SSID_SG_ticket_guid = s.ftTicketGuid
	WHERE s.ftTicketGuid IS NULL


	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactAvailSeats', @Source = 'etl.vw_Load_SG_FactAvailSeats'
	, @BusinessKey = 'ETL__SSID_SG_ticket_guid', @SourceSystem = 'SG'


	EXEC etl.SG_LoadFactInventory_Seats

	
	SELECT 'Step 6...', GETDATE() ts


	EXEC etl.SG_LoadFactInventory_Held @BatchId = @BatchId, @Options = @Options


	--EXEC etl.SG_LoadFactInventory_Held_Plans @BatchId = @BatchId, @Options = @Options

	
	EXEC etl.SG_LoadFactInventory_Avail	@BatchId = @BatchId, @Options = @Options


	--EXEC etl.SG_LoadFactInventory_Avail_Plans	@BatchId = @BatchId, @Options = @Options


	EXEC etl.SG_LoadFactInventory_Sales


	SELECT 'Step 7...', GETDATE() ts


	--EXEC etl.SG_LoadFactInventory_Resold --@BatchId = @BatchId, @Options = @Options
	

	--EXEC etl.SG_LoadFactInventory_Tranferred --@BatchId = @BatchId, @Options = @Options


	SELECT 'Step 8...', GETDATE() ts


	EXEC etl.SG_LoadFactInventory_Seats_GA @BatchId = @BatchId, @Options = @Options
	

	SELECT 'Step 9...', GETDATE() ts


	/*Disabled ZFrick due to invalid column error. Kaitlyn is looking into fixing*/
	--EXEC etl.SG_LoadFactAttendance @BatchId = @BatchId, @Options = @Options


	SELECT 'Step 10...', GETDATE() ts

END
















GO
