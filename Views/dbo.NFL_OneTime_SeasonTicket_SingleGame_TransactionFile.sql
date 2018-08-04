SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[NFL_OneTime_SeasonTicket_SingleGame_TransactionFile]
AS
SELECT CASE
           WHEN DB_NAME() = 'Bears' THEN
               'BE'
           WHEN DB_NAME() = 'Bengals' THEN
               'BG'
           WHEN DB_NAME() = 'Bills' THEN
               'BI'
           WHEN DB_NAME() = 'Broncos' THEN
               'BO'
           WHEN DB_NAME() = 'Buccaneers' THEN
               'BC'
           WHEN DB_NAME() = 'Chargers' THEN
               'CH'
           WHEN DB_NAME() = 'Chiefs' THEN
               'CF'
           WHEN DB_NAME() = 'Colts' THEN
               'CT'
           WHEN DB_NAME() = 'Cowboys' THEN
               'CB'
           WHEN DB_NAME() = 'Dolphins' THEN
               'DO'
           WHEN DB_NAME() = 'Falcons' THEN
               'FA'
           WHEN DB_NAME() = 'Jaguars' THEN
               'JA'
           WHEN DB_NAME() = 'Jets' THEN
               'JE'
           WHEN DB_NAME() = 'Lions' THEN
               'LI'
           WHEN DB_NAME() = 'Panthers' THEN
               'CP'
           WHEN DB_NAME() = 'Raiders' THEN
               'RA'
           WHEN DB_NAME() = 'Rams' THEN
               'RM'
           WHEN DB_NAME() = 'Redskins' THEN
               'RS'
           WHEN DB_NAME() = 'Saints' THEN
               'SA'
           WHEN DB_NAME() = 'Seahawks' THEN
               'SE'
           WHEN DB_NAME() = 'Steelers' THEN
               'ST'
           WHEN DB_NAME() = 'Titans' THEN
               'TT'
           WHEN DB_NAME() = 'Vikings' THEN
               'VI'
           ELSE
               '??'
       END AS nfl_team_code,
       CAST(fts.ETL__SSID_TM_acct_id AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_TM_event_id AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_TM_section_id AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_TM_row_id AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_TM_seat_num AS NVARCHAR(25)) + ':' + CAST(fts.QtySeat AS NVARCHAR(25)) AS ticket_orders_id,
       dc.SSID AS ticket_customers_id,
       DB_NAME() AS Club,
       de.EventName AS Opponent,
       dd.CalDate AS DateStamp,
       ds.SeasonYear AS Season,
       CASE WHEN dp.PlanClass = 'FS' THEN 1 ELSE 0 END AS SeasonTicketFlag, -- Update Season Ticket Holder Logic for your team here
       CASE WHEN dp.PlanClass != 'FS' OR fts.DimPlanId = 0 THEN 1 ELSE 0 END AS SingleGameFlag, -- Update Single Game Buyer Logic for your team here
       fts.QtySeat,
       fts.RevenueTotal AS [TotalRevenue]
FROM dbo.FactTicketSales_V2 fts (NOLOCK)
JOIN dbo.DimCustomer dc ON dc.DimCustomerId = fts.DimTicketCustomerId
JOIN dbo.DimDate dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimSeason_v2 ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimPlan_V2 dp ON dp.DimPlanId = fts.DimPlanId
JOIN  dbo.DimEvent_V2 de ON de.DimEventId = fts.DimEventId
WHERE (ds.dimseasonid IN (64, 101, 122, 151, 185, 231, 254, 290, 24, 77, 107, 153, 191, 213, 239, 300, 28, 87, 154, 205, 117))
AND de.EventName NOT IN
(
'WrestleMania Suite Passes',
'UT/UCLA SuitePass',
'Texas Tech VS Baylor',
'UIL - 3A DI Ste Pass',
'UIL - Conf 2A & 3A Suite',
'UIL - Conf 4A & 5A',
'UIL - Conf 5A & 6A Suite',
'UIL Football Suite Pass',
'UIL--1A DI & DII & 2A DI',
'UIL-1A DII DI, 2A DII Pss',
'UIL--2A & 3A DII, 4A DI',
'UIL-2A DI, 3A /4A DII Pss',
'UIL-4A DI, 5A DII/DI Pss',
'UIL--4A DII, 5A DI & DII',
'USA Football Suite Passes',
'TCU vs BYU Suite Passes',
'TCU vs LSU Suite Pass',
'Taylor Swift Suite Passes',
'Taylor Swift Suite Pass',
'Supercross SuitePass',
'Supercross Suite Passes',
'Supercross Suite Pass',
'STESELLRENEWEVENT',
'Southwest Showcase Suite',
'Southwest HS Football',
'Southwest Classic Suite P',
'Southwest Classic Suite',
'Silv/Blue Debut Ste Pass',
'Shelton vs Parish SP',
'Reebok Spartan Race Suite',
'Rolling Stones Suite Pass',
'PBR SuitePass',
'PBR Suite Passes',
'PBR Suite Pass',
'OSU/FSU SuitePass',
'Opponent',
'Opera Simulcast Suite Pas',
'One Direction SuitePass',
'ND vs ASU Suite Pass',
'NCAA BBall Day 2 Ste Pass',
'NCAA BBall Day 1 Ste Pass',
'Nastia Liukin Cup Passes',
'Monster Jam SuitePass',
'Monster Jam Suite Passes',
'Monster Jam Suite Pass',
'MFF Mon - Ses 2 SuitePass',
'MFF Fri - Ses 1 SuitePass',
'Mexico/Ecuador SuitePass',
'Mexico vs Argentina Suite',
'MEX vs BRA Suite Passes',
'Luke Bryan Suite Passes',
'Lonestar Suite Passes',
'Lonestar FB Suite Pass',
'Lonestar FB Suite Pass',
'Lone Star THU Suite Pass',
'Lone Star SAT Suite Pass',
'Lone Star FRI Suite Pass',
'Lone Star Conf Football',
'Kenny Chesney Suite Passe',
'Kenny Chesney Suite Pass',
'Jay Z SuitePass',
'HSF PO - 4 Gms Ste Passes',
'HSF PO - 2 Gms Ste Passes',
'HS Playoffs Suite Passes',
'HS Playoffs Suite Pass',
'HS Playoffs Owners Club',
'Harvest America Suite Pas',
'High School FB Playoffs',
'Guns N Roses Suite Passes',
'Gold Cup Suite Pass',
'George Strait SuitePass',
'Dallas Opera Suite Passes',
'Dallas Opera Suite Pass',
'Dallas Opera',
'Cotton Bowl Suite Passes',
'Cotton Bowl Suite Pass',
'Coldplay Suite Passes',
'CFP Suite Passes',
'Champ Game Suite Passes',
'Boxing Suite Passes',
'Beyonce Suite Passe',
'Baylor/Tech Suite Passes',
'Baylor/Tech Suite Pass',
'Baylor/Kentucky SuitePass',
'Baylor vs Texas Tech Suit',
'Baylor vs Tech Ste Passes',
'BAY vs TT Suite Passes',
'ARK/TAMU SuitePass',
'ARK vs A&M Suite Passes',
'American Rodeo SuitePass',
'American Rodeo Suite Pass',
'American Cup Suite Passes',
'Alabama v Mich Suite Pass',
'Advocare Classic Suite',
'AdvoCar Classic Suite Pas',
'ACMs Suite Pass',
'2014 UIL FOOTB Suite Pass',
'13 Hours Suite Passes',
'15 Cowboys Mobile TEST',
'15 TMDCowboys Mobile TEST',
'2014 Arlington Showdown S'
)
AND de.EventName NOT LIKE '%Suite Passes'

UNION 

SELECT CASE
           WHEN DB_NAME() = 'Bears' THEN
               'BE'
           WHEN DB_NAME() = 'Bengals' THEN
               'BG'
           WHEN DB_NAME() = 'Bills' THEN
               'BI'
           WHEN DB_NAME() = 'Broncos' THEN
               'BO'
           WHEN DB_NAME() = 'Buccaneers' THEN
               'BC'
           WHEN DB_NAME() = 'Chargers' THEN
               'CH'
           WHEN DB_NAME() = 'Chiefs' THEN
               'CF'
           WHEN DB_NAME() = 'Colts' THEN
               'CT'
           WHEN DB_NAME() = 'Cowboys' THEN
               'CB'
           WHEN DB_NAME() = 'Dolphins' THEN
               'DO'
           WHEN DB_NAME() = 'Falcons' THEN
               'FA'
           WHEN DB_NAME() = 'Jaguars' THEN
               'JA'
           WHEN DB_NAME() = 'Jets' THEN
               'JE'
           WHEN DB_NAME() = 'Lions' THEN
               'LI'
           WHEN DB_NAME() = 'Panthers' THEN
               'CP'
           WHEN DB_NAME() = 'Raiders' THEN
               'RA'
           WHEN DB_NAME() = 'Rams' THEN
               'RM'
           WHEN DB_NAME() = 'Redskins' THEN
               'RS'
           WHEN DB_NAME() = 'Saints' THEN
               'SA'
           WHEN DB_NAME() = 'Seahawks' THEN
               'SE'
           WHEN DB_NAME() = 'Steelers' THEN
               'ST'
           WHEN DB_NAME() = 'Titans' THEN
               'TT'
           WHEN DB_NAME() = 'Vikings' THEN
               'VI'
           ELSE
               '??'
       END AS nfl_team_code,
       CAST(fts.ETL__SSID_TM_acct_id AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_TM_event_id AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_TM_section_id AS NVARCHAR(25)) + ':' + CAST(fts.ETL__SSID_TM_row_id AS NVARCHAR(25)) + ':'
       + CAST(fts.ETL__SSID_TM_seat_num AS NVARCHAR(25)) + ':' + CAST(fts.QtySeat AS NVARCHAR(25)) AS ticket_orders_id,
       dc.SSID AS ticket_customers_id,
       DB_NAME() AS Club,
       de.EventName AS Opponent,
       dd.CalDate AS DateStamp,
       ds.SeasonYear AS Season,
       CASE WHEN dp.PlanClass = 'FS' THEN 1 ELSE 0 END AS SeasonTicketFlag, -- Update Season Ticket Holder Logic for your team here
       CASE WHEN dp.PlanClass != 'FS' OR fts.DimPlanId = 0 THEN 1 ELSE 0 END AS SingleGameFlag, -- Update Single Game Buyer Logic for your team here
       fts.QtySeat,
       fts.RevenueTotal AS [TotalRevenue]
FROM dbo.FactTicketSales_V2_History fts (NOLOCK)
JOIN dbo.DimCustomer dc ON dc.DimCustomerId = fts.DimTicketCustomerId
JOIN dbo.DimDate dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimSeason_v2 ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimPlan_V2 dp ON dp.DimPlanId = fts.DimPlanId
JOIN  dbo.DimEvent_V2 de ON de.DimEventId = fts.DimEventId
WHERE (ds.dimseasonid IN (64, 101, 122, 151, 185, 231, 254, 290, 24, 77, 107, 153, 191, 213, 239, 300, 87, 154, 205, 117, 186, 209, 252))
AND de.EventName NOT IN
(
'WrestleMania Suite Passes',
'UT/UCLA SuitePass',
'Texas Tech VS Baylor',
'UIL - 3A DI Ste Pass',
'UIL - Conf 2A & 3A Suite',
'UIL - Conf 4A & 5A',
'UIL - Conf 5A & 6A Suite',
'UIL Football Suite Pass',
'UIL--1A DI & DII & 2A DI',
'UIL-1A DII DI, 2A DII Pss',
'UIL--2A & 3A DII, 4A DI',
'UIL-2A DI, 3A /4A DII Pss',
'UIL-4A DI, 5A DII/DI Pss',
'UIL--4A DII, 5A DI & DII',
'USA Football Suite Passes',
'TCU vs BYU Suite Passes',
'TCU vs LSU Suite Pass',
'Taylor Swift Suite Passes',
'Taylor Swift Suite Pass',
'Supercross SuitePass',
'Supercross Suite Passes',
'Supercross Suite Pass',
'STESELLRENEWEVENT',
'Southwest Showcase Suite',
'Southwest HS Football',
'Southwest Classic Suite P',
'Southwest Classic Suite',
'Silv/Blue Debut Ste Pass',
'Shelton vs Parish SP',
'Reebok Spartan Race Suite',
'Rolling Stones Suite Pass',
'PBR SuitePass',
'PBR Suite Passes',
'PBR Suite Pass',
'OSU/FSU SuitePass',
'Opponent',
'Opera Simulcast Suite Pas',
'One Direction SuitePass',
'ND vs ASU Suite Pass',
'NCAA BBall Day 2 Ste Pass',
'NCAA BBall Day 1 Ste Pass',
'Nastia Liukin Cup Passes',
'Monster Jam SuitePass',
'Monster Jam Suite Passes',
'Monster Jam Suite Pass',
'MFF Mon - Ses 2 SuitePass',
'MFF Fri - Ses 1 SuitePass',
'Mexico/Ecuador SuitePass',
'Mexico vs Argentina Suite',
'MEX vs BRA Suite Passes',
'Luke Bryan Suite Passes',
'Lonestar Suite Passes',
'Lonestar FB Suite Pass',
'Lonestar FB Suite Pass',
'Lone Star THU Suite Pass',
'Lone Star SAT Suite Pass',
'Lone Star FRI Suite Pass',
'Lone Star Conf Football',
'Kenny Chesney Suite Passe',
'Kenny Chesney Suite Pass',
'Jay Z SuitePass',
'HSF PO - 4 Gms Ste Passes',
'HSF PO - 2 Gms Ste Passes',
'HS Playoffs Suite Passes',
'HS Playoffs Suite Pass',
'HS Playoffs Owners Club',
'Harvest America Suite Pas',
'High School FB Playoffs',
'Guns N Roses Suite Passes',
'Gold Cup Suite Pass',
'George Strait SuitePass',
'Dallas Opera Suite Passes',
'Dallas Opera Suite Pass',
'Dallas Opera',
'Cotton Bowl Suite Passes',
'Cotton Bowl Suite Pass',
'Coldplay Suite Passes',
'CFP Suite Passes',
'Champ Game Suite Passes',
'Boxing Suite Passes',
'Beyonce Suite Passe',
'Baylor/Tech Suite Passes',
'Baylor/Tech Suite Pass',
'Baylor/Kentucky SuitePass',
'Baylor vs Texas Tech Suit',
'Baylor vs Tech Ste Passes',
'BAY vs TT Suite Passes',
'ARK/TAMU SuitePass',
'ARK vs A&M Suite Passes',
'American Rodeo SuitePass',
'American Rodeo Suite Pass',
'American Cup Suite Passes',
'Alabama v Mich Suite Pass',
'Advocare Classic Suite',
'AdvoCar Classic Suite Pas',
'ACMs Suite Pass',
'2014 UIL FOOTB Suite Pass',
'2014 UIL FOOTB Suite Pass',
'13 Hours Suite Passes',
'15 Cowboys Mobile TEST',
'15 TMDCowboys Mobile TEST',
'2014 Arlington Showdown S'
)

--AND ISNULL(de.EventName,'') NOT IN ('', 'TBD', 'MBS Open House', 'January 21, 2018') -- Update Season Logic here



--SELECT DISTINCT fts.DimSeasonId, ds.seasonname, ds.seasonyear
--FROM dbo.FactTicketSales_V2 fts
--JOIN dbo.DimSeason_v2 ds ON fts.DimSeasonId = ds.DimSeasonId
--WHERE ds.seasonyear between 2014 AND 2017
--ORDER BY ds.seasonyear






GO
