SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [mdm].[vw_MDM_Prep_bkp] AS

SELECT dc.dimcustomerid, sth.STH, cc.CC, sg.SG
FROM dbo.dimcustomer dc
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'STH'
			FROM dbo.FactTicketSales_V2 f
			JOIN dbo.DimTicketCustomer_V2 dtc
				ON f.DimTicketCustomerId = dtc.DimTicketCustomerId
			JOIN dbo.DimCustomer dc
				ON dtc.ETL__SourceSystem = dc.SourceSystem
				AND dtc.ETL__SSID_TM_acct_id = dc.AccountId
				AND dc.CustomerType = 'Primary'
			JOIN dbo.DimEvent_V2 e
				ON f.DimEventId = e.DimEventId
			JOIN dbo.DimEventHeader_V2 eh
				ON e.DimEventHeaderId = eh.DimEventHeaderId
			JOIN dbo.DimSeasonHeader_V2 sh
				ON eh.DimSeasonHeaderId = sh.DimSeasonHeaderId
			WHERE f.DimTicketTypeId = 1 AND sh.SeasonYear = YEAR(GETDATE())
		   ) sth ON dc.dimcustomerid = sth.dimcustomerid
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'CC'
			FROM dbo.FactTicketSales_V2 f
			JOIN dbo.DimTicketCustomer_V2 dtc
				ON f.DimTicketCustomerId = dtc.DimTicketCustomerId
			JOIN dbo.DimCustomer dc
				ON dtc.ETL__SourceSystem = dc.SourceSystem
				AND dtc.ETL__SSID_TM_acct_id = dc.AccountId
				AND dc.CustomerType = 'Primary'
			JOIN dbo.DimEvent_V2 e
				ON f.DimEventId = e.DimEventId
			JOIN dbo.DimEventHeader_V2 eh
				ON e.DimEventHeaderId = eh.DimEventHeaderId
			JOIN dbo.DimSeasonHeader_V2 sh
				ON eh.DimSeasonHeaderId = sh.DimSeasonHeaderId
			WHERE f.DimTicketTypeId = 9 AND sh.SeasonYear = YEAR(GETDATE())
		   ) cc ON dc.dimcustomerid = cc.dimcustomerid
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'SG'
			FROM dbo.FactTicketSales_V2 f
			JOIN dbo.DimTicketCustomer_V2 dtc
				ON f.DimTicketCustomerId = dtc.DimTicketCustomerId
			JOIN dbo.DimCustomer dc
				ON dtc.ETL__SourceSystem = dc.SourceSystem
				AND dtc.ETL__SSID_TM_acct_id = dc.AccountId
				AND dc.CustomerType = 'Primary'
			JOIN dbo.DimDate dd
				ON f.DimDateId = dd.DimDateId
			WHERE f.DimTicketTypeId NOT IN (1, 9) AND dd.CalDate >= (GETDATE() - 365)
			) sg ON dc.DimCustomerId = sg.DimCustomerId

GO
