SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId NVARCHAR (50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS




BEGIN

/*****************************************************************************************************************
												Ticket Type
******************************************************************************************************************/

-- Full Season --
UPDATE f
SET f.DimTicketTypeId = 1
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SG%'
AND (pc.PriceCode LIKE '%N' OR pc.PriceCode LIKE '%R')




-- Single Game --
UPDATE f
SET f.DimTicketTypeId = 2
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%SZ' OR LEN(pc.PriceCode) = 1



-- Single Game ADA --
UPDATE f
SET f.DimTicketTypeId = 3
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%ADA'



-- Rally Day --
UPDATE f
SET f.DimTicketTypeId = 4
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '17APP'
AND pc.PriceCode = 'A'



-- One-Year Parking --
UPDATE f
SET f.DimTicketTypeId = 5
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%OY'



-- Parking --
UPDATE f
SET f.DimTicketTypeId = 6
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%C'




-- Suite --
UPDATE f
SET f.DimTicketTypeId = 7
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE (e.EventCode LIKE '17SS%' OR e.EventCode LIKE '17LS%')
AND (pc.PriceCode LIKE '%N' OR pc.PriceCode LIKE '%R')



-- Stadium Club --
UPDATE f
SET f.DimTicketTypeId = 8
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE (e.EventCode LIKE '17RE%' AND e.EventCode NOT LIKE '17RES%' AND e.EventCode NOT LIKE '17REP%')
	AND pc.PriceCode IN ('AN', 'AR', 'ARD')



-- Cowboys Club --
UPDATE f
SET f.DimTicketTypeId = 9
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '16CLUB' AND (pc.PriceCode LIKE 'AMP%' OR pc.PriceCode LIKE 'AMC%')



-- Party Pass --
UPDATE f
SET f.DimTicketTypeId = 10
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SR%' AND pc.PriceCode IN ('AWR', 'AWN', 'AER', 'AEN', 'AW', 'AE')



/*****************************************************************************************************************
													PLAN TYPE
******************************************************************************************************************/

-- New --
UPDATE f
SET f.DimPlanTypeID = 1
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%N'



-- Renewal --
UPDATE f
SET f.DimPlanTypeID = 2
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%R'



-- Add-On/Internal --
UPDATE f
SET f.DimPlanTypeID = 3
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%SZ' OR LEN(pc.PriceCode) = 1





/*****************************************************************************************************************
													TICKET CLASS
******************************************************************************************************************/

-- Full Season New --
UPDATE f
SET f.DimTicketClassID = 1
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode like '17SG%' and pc.PriceCode LIKE '%N'




-- Full Season Renewal --
UPDATE f
SET f.DimTicketClassID = 2
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode like '17SG%' and pc.PriceCode LIKE '%R'



-- Single Game Add-On/Internal --
UPDATE f
SET f.DimTicketClassID = 3
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%SZ' OR LEN(pc.PriceCode) = 1




-- Single Game Founders --
UPDATE f
SET f.DimTicketClassID = 4
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode = 'AFS'



-- Single Game ADA --
UPDATE f
SET f.DimTicketClassID = 5
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%ADA'



-- Rally Day --
UPDATE f
SET f.DimTicketClassID = 6
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '17APP' AND pc.PriceCode = 'A' 



-- One-Year Parking --
UPDATE f
SET f.DimTicketClassID = 7
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode = 'OY'



-- Season Parking --
UPDATE f
SET f.DimTicketClassID = 8
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE pc.PriceCode LIKE '%C'



-- Suite New --
UPDATE f
SET f.DimTicketClassID = 9
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE (e.EventCode LIKE 'SS%' OR e.EventCode LIKE 'LS%') AND pc.PriceCode LIKE '%N'



-- Suite Renewal --
UPDATE f
SET f.DimTicketClassID = 10
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE (e.EventCode LIKE 'SS%' OR e.EventCode LIKE 'LS%') AND pc.PriceCode LIKE '%R'



-- Stadium Club New --
UPDATE f
SET f.DimTicketClassID = 12
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17RE%' AND pc.PriceCode = 'AN'



-- Stadium Club Renewal --
UPDATE f
SET f.DimTicketClassID = 11
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17RE%' AND pc.PriceCode IN ('AR', 'ARD')



-- Cowboys Club Corporate --
UPDATE f
SET f.DimTicketClassID = 13
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '16CLUB' AND pc.PriceCode = 'AMC'



-- Cowboys Club Personal --
UPDATE f
SET f.DimTicketClassID = 14
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode = '16CLUB' AND pc.PriceCode = 'AMP'



-- Party Pass Season --
UPDATE f
SET f.DimTicketClassID = 15
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SR%' AND pc.PriceCode IN ('AWR', 'AWN', 'AER', 'AEN')



-- Party Pass Single Game --
UPDATE f
SET f.DimTicketClassID = 16
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
WHERE e.EventCode LIKE '17SR%' AND pc.PriceCode IN ('AW', 'AE')


/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/



-- Owners --
UPDATE f
SET f.DimSeatTypeID = 1
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE PC2 = 'O' AND SectionName LIKE 'C%'



-- Optum --
UPDATE f
SET f.DimSeatTypeID = 2
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE pc.PC2 = 'L'



-- Founders --
UPDATE f
SET f.DimSeatTypeID = 3
FROM stg.TM_FactTicketSales f
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE pc.PC2 = 'F'


-- Club --
UPDATE f
SET f.DimSeatTypeID = 4
FROM stg.TM_FactTicketSales f
JOIN dbo.DimPriceLevel_V2 pl
	ON pl.DimPriceLevelId = f.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt
	ON pt.DimPriceTypeId = f.DimPriceTypeId
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE PriceLevelName IN ('A', 'B', 'C', 'D') AND PriceTypeName NOT LIKE '%optum%'


 -- Reserve --
UPDATE f
SET f.DimSeatTypeID = 5
FROM stg.TM_FactTicketSales f
JOIN dbo.DimPriceLevel_V2 pl
	ON pl.DimPriceLevelId = f.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt
	ON pt.DimPriceTypeId = f.DimPriceTypeId
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE PriceLevelName IN ('E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N') AND PriceTypeName NOT LIKE '%FAA%'



 -- Non-Option --
UPDATE f
SET f.DimSeatTypeID = 6
FROM stg.TM_FactTicketSales f
JOIN dbo.DimPriceLevel_V2 pl
	ON pl.DimPriceLevelId = f.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt
	ON pt.DimPriceTypeId = f.DimPriceTypeId
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE PriceLevelName IN ('O', 'P')


 -- Legends --
UPDATE f
SET f.DimSeatTypeID = 7
FROM stg.TM_FactTicketSales f
JOIN dbo.DimPriceLevel_V2 pl
	ON pl.DimPriceLevelId = f.DimPriceLevelId
JOIN dbo.DimPriceType_V2 pt
	ON pt.DimPriceTypeId = f.DimPriceTypeId
JOIN dbo.DimEvent_V2 e
	ON f.DimEventId = e.DimEventId
JOIN dbo.DimPriceCode_V2 pc
	ON f.DimPriceCodeId = pc.DimPriceCodeId
JOIN dbo.DimSeat_V2 s
	ON f.DimSeatId_Start = s.DimSeatId
WHERE PriceTypeName LIKE '%optum%' AND PriceTypeName NOT LIKE '%suite%'



/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/

UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 0
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM stg.TM_FactTicketSales f
WHERE DimTicketTypeId IN (1,5,6,7,8, 9) OR f.DimTicketClassId = 15


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 0
FROM stg.TM_FactTicketSales f
WHERE DimTicketTypeId IN (2, 3) OR f.DimTicketClassId = 16


UPDATE f
SET f.IsRenewal = 1
FROM stg.TM_FactTicketSales f
INNER JOIN dbo.DimPlanType_V2 dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID = 2


UPDATE f
SET f.IsRenewal = 0
FROM stg.TM_FactTicketSales f
INNER JOIN dbo.DimPlanType_V2 dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID <> 2



END
























GO
