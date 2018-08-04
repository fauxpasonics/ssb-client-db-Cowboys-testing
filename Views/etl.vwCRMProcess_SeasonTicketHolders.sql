SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vwCRMProcess_SeasonTicketHolders]
AS

--updateme if using STH functionality
SELECT DISTINCT dc.SSID
, NULL SeasonYear
, NULL SeasonYr
FROM dbo.FactTicketSales_V2 ts WITH (NOLOCK)
INNER JOIN dbo.DimCustomer dc WITH (NOLOCK) ON dc.AccountId=ts.ETL__SSID_TM_acct_id AND dc.SourceSystem = 'tm' --updateme
WHERE 0=1
GO
