SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [etl].[Cust_FactTicketSalesProcessing_SG]
(
	@BatchId NVARCHAR (50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS

-------------------------------------------------------------------------------

-- Author name:		Kaitlyn Nelson
-- Created date:	May 218
-- Purpose:			Define logic and prep data to push to CRM custom fields
--					in MS Dynamics outbound integration

-- Copyright © 2018, SSB, All Rights Reserved

-------------------------------------------------------------------------------

-- Modification History --

-- 2018-06-26:			Kaitlyn Nelson
-- Change notes:		Added logic for salesperson and serviceperson fields
-- Peer reviewed by:	Keegan Schmitt
-- Peer review notes:	Looks good
-- Peer review date:	2018-06-26
-- Deployed by:			Bulent Gucuk
-- Deployment date:		2018-06-27
-- Deployment notes:	Stored procedure deployed to production


-- 2018-07-26:			Keegan Schmitt
-- Change notes:		Added Suite and STH class logic
-- Peer reviewed by:	Kaitlyn Nelson
-- Peer review notes:	Moved Suite and STH logic out of the SeatType tag
--						and put it into the custom nvarchar fields so that
--						we don't limit the seat type tag to only include
--						Suite and STH tickets
-- Peer review date:	2018-07-27
-- Deployed by:			Bulent Gucuk
-- Deployment date:		2018-07-30
-- Deployment notes:

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

BEGIN

/*****************************************************************************************************************
												Ticket Type
******************************************************************************************************************/

-- Full Season --
UPDATE f
SET f.DimTicketTypeId = 1
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
WHERE p.PlanName = '2018 DCFC Stands Season'




-- Single Game --
UPDATE f
SET f.DimTicketTypeId = 2
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('Standard', 'SZ - Season price for single game club seats ')



-- Single Game ADA --
UPDATE f
SET f.DimTicketTypeId = 3
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('ADA SINGLE GAME')
-- seat type is wheelchair or semi ambulatory



/* Not created yet, follow up after 5/7
-- Rally Day --
UPDATE f
SET f.DimTicketTypeId = 4
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '17APP'
AND pc.PriceCode = 'A'
*/



-- One-Year Parking --
UPDATE f
SET f.DimTicketTypeId = 5
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('One Year Bus (Lot 15) No Overnight Parking', 'One Year Limo Parking '
	, 'One Year Parking', 'One Year RV (Lot 14)')



-- Parking --
UPDATE f
SET f.DimTicketTypeId = 6
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%parking%'
	AND pt.PriceTypeName NOT IN ('One Year Bus (Lot 15) No Overnight Parking', 'One Year Limo Parking '
		, 'One Year Parking', 'One Year RV (Lot 14)')




-- Suite --
UPDATE f
SET f.DimTicketTypeId = 7
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
WHERE p.PlanName = '2018 DCFC Suites'



-- Stadium Club --
UPDATE f
SET f.DimTicketTypeId = 8
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
WHERE p.PlanName = '2018 Stadium Club'



/* Only applies to TM transactions
-- Cowboys Club --
UPDATE f
SET f.DimTicketTypeId = 9
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '16CLUB' AND (pc.PriceCode LIKE 'AMP%' OR pc.PriceCode LIKE 'AMC%')
*/


/*
-- Party Pass --
UPDATE f
SET f.DimTicketTypeId = 10
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SR%' AND pc.PriceCode IN ('AWR', 'AWN', 'AER', 'AEN', 'AW', 'AE')
*/


/*****************************************************************************************************************
													PLAN TYPE
******************************************************************************************************************/

-- New --
UPDATE f
SET f.DimPlanTypeID = 1
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%new%'
	AND pt.PriceTypeName NOT LIKE '%renew%'



-- Renewal --
UPDATE f
SET f.DimPlanTypeID = 2
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%renew%'



-- Add-On/Internal --
UPDATE f
SET f.DimPlanTypeID = 3
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('Standard', 'SZ - Season price for single game club seats ')





/*****************************************************************************************************************
													TICKET CLASS
******************************************************************************************************************/

-- Full Season New --
UPDATE f
SET f.DimTicketClassID = 1
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE p.PlanName = '2018 DCFC Stands Season'
	AND pt.PriceTypeName LIKE '%new%'
	AND pt.PriceTypeName NOT LIKE '%renew%'




-- Full Season Renewal --
UPDATE f
SET f.DimTicketClassID = 2
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE p.PlanName = '2018 DCFC Stands Season'
	AND pt.PriceTypeName LIKE '%renew%'



-- Single Game Add-On/Internal --
UPDATE f
SET f.DimTicketClassID = 3
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('Standard', 'SZ - Season price for single game club seats ')



/*
-- Single Game Founders --
UPDATE f
SET f.DimTicketClassID = 4
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode = 'AFS'
*/


-- Single Game ADA --
UPDATE f
SET f.DimTicketClassID = 5
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('ADA SINGLE GAME')
-- seat type is wheelchair or semi ambulatory



/* Not created yet, follow up after 5/7
-- Rally Day --
UPDATE f
SET f.DimTicketClassID = 6
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '17APP' AND pc.PriceCode = 'A' 
*/



-- One-Year Parking --
UPDATE f
SET f.DimTicketClassID = 7
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('One Year Bus (Lot 15) No Overnight Parking', 'One Year Limo Parking '
		, 'One Year Parking', 'One Year RV (Lot 14)')



-- Season Parking --
UPDATE f
SET f.DimTicketClassID = 8
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%parking%'
	AND pt.PriceTypeName NOT IN ('One Year Bus (Lot 15) No Overnight Parking', 'One Year Limo Parking '
		, 'One Year Parking', 'One Year RV (Lot 14)')




-- Suite New --
UPDATE f
SET f.DimTicketClassID = 9
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE p.PlanName = '2018 DCFC Suites'
	AND pt.PriceTypeName LIKE '%new%'
	AND pt.PriceTypeName NOT LIKE '%renew%'



-- Suite Renewal --
UPDATE f
SET f.DimTicketClassID = 10
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE p.PlanName = '2018 DCFC Suites'
	AND pt.PriceTypeName LIKE '%renew%'



-- Stadium Club New --
UPDATE f
SET f.DimTicketClassID = 12
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE p.PlanName = '2018 Stadium Club'
	AND pt.PriceTypeName LIKE '%new%'
	AND pt.PriceTypeName NOT LIKE '%renew%'



-- Stadium Club Renewal --
UPDATE f
SET f.DimTicketClassID = 11
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPlan_V2 p (NOLOCK)
	ON f.DimPlanId = p.DimPlanId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE p.PlanName = '2018 Stadium Club'
	AND pt.PriceTypeName LIKE '%renew%'



/* Only applies to TM transactions
-- Cowboys Club Corporate --
UPDATE f
SET f.DimTicketClassID = 13
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '16CLUB' AND pc.PriceCode = 'AMC'



-- Cowboys Club Personal --
UPDATE f
SET f.DimTicketClassID = 14
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '16CLUB' AND pc.PriceCode = 'AMP'
*/


/*
-- Party Pass Season --
UPDATE f
SET f.DimTicketClassID = 15
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SR%' AND pc.PriceCode IN ('AWR', 'AWN', 'AER', 'AEN')



-- Party Pass Single Game --
UPDATE f
SET f.DimTicketClassID = 16
FROM stg.SG_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SR%' AND pc.PriceCode IN ('AW', 'AE')
*/

/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/

-- Owners --
UPDATE f
SET f.DimSeatTypeID = 1
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%Owners%'



-- Optum --
UPDATE f
SET f.DimSeatTypeID = 2
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE PriceTypeName LIKE '%Optum%'



-- Founders --
UPDATE f
SET f.DimSeatTypeID = 3
FROM stg.SG_FactTicketSales f
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE PriceTypeName LIKE '%FAA%'



/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/

UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 0
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM stg.SG_FactTicketSales f
WHERE DimTicketTypeId IN (1,5,6,7,8, 9) OR f.DimTicketClassId = 15


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 0
FROM stg.SG_FactTicketSales f
WHERE DimTicketTypeId IN (2, 3) OR f.DimTicketClassId = 16


UPDATE f
SET f.IsRenewal = 1
FROM stg.SG_FactTicketSales f
INNER JOIN dbo.DimPlanType_V2 dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID = 2


UPDATE f
SET f.IsRenewal = 0
FROM stg.SG_FactTicketSales f
INNER JOIN dbo.DimPlanType_V2 dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID <> 2


/*****************************************************************************************************************
													Suite Classes
******************************************************************************************************************/

-- Regular --
UPDATE f
SET f.Custom_nVarChar_1 = 'Regular Suite'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('NEW Suite', 'NEW Suite SRO', 'RENEWAL Suite', 'RENEWAL Suite SRO')



-- Owners --
UPDATE f
SET f.Custom_nVarChar_1 = 'Owners Suite'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName IN ('NEW Suite AI', 'RENEWAL Suite AI')



-- Optum --
UPDATE f
SET f.Custom_nVarChar_1 = 'Optum Suite'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE PriceTypeName IN ('NEW Suite AI Optum', 'NEW Suite AI Optum SRO', 'RENEWAL Suite AI Optum SRO', 'RENEWAL Suite AI Optum')
	


/*****************************************************************************************************************
													STH Classes
******************************************************************************************************************/

-- Club --
UPDATE f
SET f.Custom_nVarChar_1 = 'Club STH'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceLevel_V2 pl (NOLOCK)
	ON f.DimPriceLevelId = pl.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE PriceLevelName IN ('A', 'B', 'C', 'D')
	AND PriceTypeName NOT LIKE '%optum%'
	AND PriceTypeName NOT LIKE '%Parking%'
	AND PriceTypeName NOT LIKE '%COMP%'
	



-- Reserve --
UPDATE f
SET f.Custom_nVarChar_1 = 'Reserve STH'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceLevel_V2 pl (NOLOCK)
	ON f.DimPriceLevelId = pl.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pl.PriceLevelName IN ('E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N')
	AND pt.PriceTypeName NOT LIKE '%FAA%'
	AND pt.PriceTypeName NOT LIKE '%Parking%'
	AND pt.PriceTypeName NOT LIKE '%COMP%'


-- Non Option --
UPDATE f
SET f.Custom_nVarChar_1 = 'Non Option STH'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceLevel_V2 pl (NOLOCK)
	ON f.DimPriceLevelId = pl.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pl.PriceLevelName IN ('O', 'P')
	AND pt.PriceTypeName NOT LIKE '%Parking%'
	AND pt.PriceTypeName NOT LIKE '%COMP%'
	


-- Optum --
UPDATE f
SET f.Custom_nVarChar_1 = 'Optum STH'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%optum%'
	AND pt.PriceTypeName NOT LIKE '%Suite%'



-- Owners --
UPDATE f
SET f.Custom_nVarChar_1 = 'Owners STH'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%owner%'
	AND pt.PriceTypeName NOT LIKE '%Suite%'



-- Founders --
UPDATE f
SET f.Custom_nVarChar_1 = 'Founders STH'
--SELECT COUNT(*)
FROM dbo.FactTicketSales_V2 f (NOLOCK)
JOIN dbo.DimPriceType_V2 pt (NOLOCK)
	ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE pt.PriceTypeName LIKE '%FAA%'
	AND pt.PriceTypeName NOT LIKE '%Suite%'

END

GO
