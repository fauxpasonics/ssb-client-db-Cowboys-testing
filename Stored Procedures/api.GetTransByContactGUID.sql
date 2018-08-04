SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [api].[GetTransByContactGUID]
    (
    @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test' ,
    @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test' ,
    @DisplayTable INT = 0 ,
    @RowsPerPage INT = 500 ,
    @PageNumber INT = 0
    )
AS

------------------------------------------------------------------------------- 
-- Author name:		Kaitlyn Nelson
-- Created date:	2018-08-03
-- Purpose:			Generate HTML used to display ticket transaction data in
--					the client's CRM system via an iFrame API

-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- MODIFYDATE: MODIFYBY 
-- CHANGEDESCRIPTION 
------------------------------------------------------------------------------- 

BEGIN

-- =========================================
-- Initial Variables for API
-- =========================================

        DECLARE @totalCount INT
          , @xmlDataNode XML
          , @recordsInResponse INT
          , @remainingCount INT
          , @rootNodeName NVARCHAR(100)
          , @responseInfoNode NVARCHAR(MAX)
          , @finalXml XML;

-- =========================================
-- GUID Table for GUIDS
-- =========================================
DECLARE @GUIDTable TABLE ( GUID VARCHAR(50) );

IF ( @SSB_CRMSYSTEM_ACCT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @GUIDTable
                ( GUID
                )
                SELECT DISTINCT
                        z.SSB_CRMSYSTEM_CONTACT_ID
                FROM    Cowboys.dbo.vwDimCustomer_ModAcctId z
                WHERE   z.SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID;
    END;

IF ( @SSB_CRMSYSTEM_CONTACT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @GUIDTable
                ( GUID
                )
                SELECT  @SSB_CRMSYSTEM_CONTACT_ID;
    END;

-- =========================================
-- Procedure
-- =========================================

SELECT DISTINCT
        'Cowboys' AS Team
      , CAST(fts.ETL__SSID_TM_acct_id AS NVARCHAR(255)) AS Account
      , ds.SeasonName
      , fts.TM_order_num AS OrderNumber
      , fts.TM_order_line_item AS OrderLine
      , dd.CalDate AS OrderDate
      , di.ItemCode AS Item
      , di.ItemName
	  , de.EventDate
      , dpc.PriceCode
      , fts.IsComp
      , dp2.PromoCode
      , fts.QtySeat AS Qty
      , ds2.SectionName
      , ds2.RowName
      , CASE WHEN TRY_CAST(ds2.Seat AS INT) IS NOT NULL THEN CONCAT(CONVERT(NVARCHAR, ds2.Seat), ':', CONVERT(NVARCHAR, (ds2.Seat + fts.QtySeat - 1 )))
			ELSE ds2.Seat END AS SeatBlock
      , fts.TM_purchase_price AS SeatPrice
      , fts.TM_block_purchase_price
      , fts.OwedAmount
      , fts.PaidAmount
	  , fts.CreatedBy AS SalesRep
INTO #Trans
FROM dbo.FactTicketSales_v2 (NOLOCK) AS fts
JOIN dbo.DimCustomer (NOLOCK) AS dc
	ON CAST(dc.AccountId AS NVARCHAR(255)) = CAST(fts.ETL__SSID_TM_acct_id AS NVARCHAR(255))
	AND dc.SourceSystem = 'TM'
JOIN dbo.dimcustomerssbid (NOLOCK) AS d
	ON d.DimCustomerId = dc.DimCustomerId
JOIN dbo.dimseason_v2 (NOLOCK) AS ds ON ds.DimSeasonId = fts.DimSeasonId
JOIN dbo.DimItem_v2 (NOLOCK) AS di ON di.DimItemId = fts.DimItemId
JOIN dbo.DimPriceCode_v2 (NOLOCK) AS dpc ON dpc.DimPriceCodeId = fts.DimPriceCodeId
JOIN dbo.DimTicketClass_v2 (NOLOCK) AS dtc ON dtc.DimTicketClassId = fts.DimTicketClassId
JOIN dbo.DimTicketType_v2 (NOLOCK) AS dtt ON fts.DimTicketTypeId = dtt.DimTicketTypeId
JOIN dbo.DimPlan_v2 (NOLOCK) AS dp ON dp.DimPlanId = fts.DimPlanId
JOIN dbo.DimDate (NOLOCK) AS dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimEvent_v2 (NOLOCK) AS de ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPromo_v2 (NOLOCK) AS dp2 ON dp2.DimPromoID = fts.DimPromoId
JOIN dbo.DimSeat_v2 (NOLOCK) AS ds2
	ON ds2.DimSeatId = fts.DimSeatId_Start
WHERE d.SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable)
	AND fts.ETL__SourceSystem = 'TM'

UNION

SELECT DISTINCT
        'Cowboys' AS Team
      , fts.ETL__SSID_SG_client_guid AS Account
      , ds.SeasonName
      , fts.SG_TransactNum AS OrderNumber
      , fts.SG_TicketNumber AS OrderLine
      , dd.CalDate AS OrderDate
      , di.ItemCode AS Item
      , di.ItemName
	  , de.EventDate
      , dpc.PriceTypeName AS PriceCode
      , fts.IsComp
      , dp2.PromoCode
      , fts.QtySeat AS Qty
      , ds2.SectionName
      , ds2.RowName
      , CASE WHEN TRY_CAST(ds2.Seat AS INT) IS NOT NULL THEN CONCAT(CONVERT(NVARCHAR, ds2.Seat), ':', CONVERT(NVARCHAR, (ds2.Seat + fts.QtySeat - 1 )))
			ELSE ds2.Seat END AS SeatBlock
      , fts.FullPrice AS SeatPrice
      , fts.FullPrice AS TM_block_purchase_price
      , fts.OwedAmount
      , fts.PaidAmount
	  , fts.CreatedBy AS SalesRep
--SELECT COUNT(*)
FROM dbo.FactTicketSales_v2 (NOLOCK) AS fts
--892313
JOIN dbo.DimCustomer (NOLOCK) AS dc
	ON CAST(dc.SSID AS NVARCHAR(255)) = fts.ETL__SSID_SG_client_guid
	AND dc.SourceSystem = 'SG'
JOIN dbo.dimcustomerssbid (NOLOCK) AS d
	ON d.DimCustomerId = dc.DimCustomerId
JOIN dbo.dimseason_v2 (NOLOCK) AS ds
	ON ds.DimSeasonId = fts.DimSeasonId
JOIN dbo.DimItem_v2 (NOLOCK) AS di
	ON di.DimItemId = fts.DimItemId
JOIN dbo.DimPriceType_v2 (NOLOCK) AS dpc
	ON dpc.DimPriceTypeId = fts.DimPriceTypeId
JOIN dbo.DimTicketClass_v2 (NOLOCK) AS dtc
	ON dtc.DimTicketClassId = fts.DimTicketClassId
JOIN dbo.DimTicketType_v2 (NOLOCK) AS dtt
	ON fts.DimTicketTypeId = dtt.DimTicketTypeId
JOIN dbo.DimPlan_v2 (NOLOCK) AS dp
	ON dp.DimPlanId = fts.DimPlanId
JOIN dbo.DimDate (NOLOCK) AS dd
	ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimEvent_v2 (NOLOCK) AS de
	ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPromo_v2 (NOLOCK) AS dp2
	ON dp2.DimPromoID = fts.DimPromoId
JOIN dbo.DimSeat_v2 (NOLOCK) AS ds2
	ON ds2.DimSeatId = fts.DimSeatId_Start
WHERE fts.ETL__SourceSystem = 'SG'
	AND d.SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable)

UNION

SELECT DISTINCT
        'Cowboys' AS Team
      , CAST(fts.ETL__SSID_TM_acct_id AS NVARCHAR(255)) AS Account
      , ds.SeasonName
      , fts.TM_order_num AS OrderNumber
      , fts.TM_order_line_item AS OrderLine
      , dd.CalDate AS OrderDate
      , di.ItemCode AS Item
      , di.ItemName
	  , de.EventDate
      , dpc.PriceCode
      , fts.IsComp
      , dp2.PromoCode
      , fts.QtySeat AS Qty
      , ds2.SectionName
      , ds2.RowName
      , CASE WHEN TRY_CAST(ds2.Seat AS INT) IS NOT NULL THEN CONCAT(CONVERT(NVARCHAR, ds2.Seat), ':', CONVERT(NVARCHAR, (ds2.Seat + fts.QtySeat - 1 )))
			ELSE ds2.Seat END AS SeatBlock
      , fts.TM_purchase_price AS SeatPrice
      , fts.TM_block_purchase_price
      , fts.OwedAmount
      , fts.PaidAmount
	  , fts.CreatedBy AS SalesRep
FROM dbo.FactTicketSales_V2_History fts (NOLOCK)
JOIN dbo.DimCustomer dc (NOLOCK)
	ON dc.AccountId = fts.ETL__SSID_TM_acct_id
	AND dc.SourceSystem = 'TM'
	AND dc.CustomerType = 'Primary'
JOIN dbo.dimcustomerssbid d (NOLOCK)
	ON d.DimCustomerId = dc.DimCustomerId
JOIN dbo.dimseason_v2 ds (NOLOCK)
	ON ds.DimSeasonId = fts.DimSeasonId
JOIN dbo.DimItem_v2 di (NOLOCK)
	ON di.DimItemId = fts.DimItemId
JOIN dbo.DimPriceCode_v2 (NOLOCK) dpc
	ON dpc.DimPriceCodeId = fts.DimPriceCodeId
JOIN dbo.DimTicketClass_v2 dtc (NOLOCK)
	ON dtc.DimTicketClassId = fts.DimTicketClassId
JOIN dbo.DimTicketType_v2 dtt (NOLOCK)
	ON dtt.DimTicketTypeId = fts.DimTicketTypeId
JOIN dbo.DimPlan_v2 dp (NOLOCK)
	ON dp.DimPlanId = fts.DimPlanId
JOIN dbo.DimDate dd (NOLOCK)
	ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimEvent_v2 de (NOLOCK)
	ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPromo_v2 dp2 (NOLOCK)
	ON dp2.DimPromoID = fts.DimPromoId
JOIN dbo.DimSeat_v2 ds2 (NOLOCK)
	ON ds2.DimSeatId = fts.DimSeatId_Start
WHERE   d.SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable);


-- =========================================
-- API Pagination
-- =========================================
-- Cap returned results at 1000

        IF @RowsPerPage > 1000
            BEGIN

                SET @RowsPerPage = 1000;

            END;

-- Pull total count

        SELECT  @totalCount = COUNT(*)
        FROM    #Trans AS c;


-- =========================================
-- Base Table Set
-- =========================================


        DECLARE @baseData TABLE
            (
              Team NVARCHAR(255)
			, Account NVARCHAR(255)
            , SeasonName NVARCHAR(255)
            , OrderNumber NVARCHAR(255)
            , OrderLine NVARCHAR(255)
            , OrderDate DATE
            , Item NVARCHAR(255)
            , ItemName NVARCHAR(255)
			, EventDate NVARCHAR(255)
            , PriceCode NVARCHAR(255)
            , IsComp BIT
            , PromoCode NVARCHAR(255)
            , Qty INT
			, SectionName NVARCHAR(255)
            , RowName NVARCHAR(255)
			, SeatBlock	 NVARCHAR(255)
            , Total DECIMAL(18, 6)
			, SeatPrice DECIMAL(18, 6)
            , AmountOwed DECIMAL(18, 6)
            , AmountPaid DECIMAL(18, 6)
			, SalesRep NVARCHAR(255)
            );

-- =========================================
-- API Loading
-- =========================================

-- Load base data

        INSERT  INTO @baseData
                SELECT  *
                FROM    #Trans AS c
                ORDER BY c.OrderDate DESC
                      , c.OrderNumber
                      OFFSET ( @PageNumber ) * @RowsPerPage ROWS

FETCH NEXT @RowsPerPage ROWS ONLY;

-- Set records in response

        SELECT  @recordsInResponse = COUNT(*)
        FROM    @baseData;
-- Create XML response data node

        SET @xmlDataNode = (
                             SELECT ISNULL(Team, '') AS Team
                                 
                                  , ISNULL(SeasonName,'') AS SeasonName
                                  , ISNULL(OrderNumber,'') AS OrderNumber
                                  , ISNULL(OrderLine,'') AS OrderLine
                                  , ISNULL(Account,'') AS Account
                                  , ISNULL(OrderDate,'') AS OrderDate
                                  , ISNULL(Item,'') AS Item
                                  , ISNULL(ItemName,'') AS ItemName
								  , ISNULL(EventDate,'') AS EventDate                                 
                                  , ISNULL(IsComp,0) AS IsComp                                
                                  , ISNULL(PromoCode,'') AS PromoCode
                                  , ISNULL(Qty,0) AS Qty
                                  , ISNULL(SeatPrice,0) AS SeatPrice
                                  , ISNULL(Total,0) AS Total
								  , ISNULL(SectionName,0) AS SectionName
								  , ISNULL(RowName,0) AS RowName
                                  , ISNULL(SeatBlock,'') AS SeatBlock
								  , ISNULL(SalesRep,'') AS SalesRep
                             FROM   @baseData
                           FOR
                             XML PATH('Parent')
                               , ROOT('Parents')
                           );

        SET @rootNodeName = 'Parents';

		-- Calculate remaining count

        SET @remainingCount = @totalCount - ( @RowsPerPage * ( @PageNumber + 1 ) );

        IF @remainingCount < 0
            BEGIN

                SET @remainingCount = 0;

            END;

			-- Create response info node

        SET @responseInfoNode = ( '<ResponseInfo>' + '<TotalCount>'
                                  + CAST(@totalCount AS NVARCHAR(20))
                                  + '</TotalCount>' + '<RemainingCount>'
                                  + CAST(@remainingCount AS NVARCHAR(20))
                                  + '</RemainingCount>'
                                  + '<RecordsInResponse>'
                                  + CAST(@recordsInResponse AS NVARCHAR(20))
                                  + '</RecordsInResponse>'
                                  + '<PagedResponse>true</PagedResponse>'
                                  + '<RowsPerPage>'
                                  + CAST(@RowsPerPage AS NVARCHAR(20))
                                  + '</RowsPerPage>' + '<PageNumber>'
                                  + CAST(@PageNumber AS NVARCHAR(20))
                                  + '</PageNumber>' + '<RootNodeName>'
                                  + @rootNodeName + '</RootNodeName>'
                                  + '</ResponseInfo>' );
    END;

-- Wrap response info and data, then return    

    IF @xmlDataNode IS NULL
        BEGIN

            SET @xmlDataNode = '<' + @rootNodeName + ' />';

        END;

    SET @finalXml = '<Root>' + @responseInfoNode
        + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>';

    SELECT  CAST(@finalXml AS XML);

GO
