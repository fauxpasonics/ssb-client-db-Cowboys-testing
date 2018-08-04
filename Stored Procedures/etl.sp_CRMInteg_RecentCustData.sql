SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[sp_CRMInteg_RecentCustData]
AS

-------------------------------------------------------------------------------

-- Modification History --

-- 2018-07-05 Keegan Schmitt
-- Added a section to be unioned for SeatGeek and added the correct join to make the table join properly

-- Peer reviewed by:
-- Peer review notes:
-- Peer review date:

-- Deployed by:
-- Deployment date:
-- Deployment notes:

-------------------------------------------------------------------------------

TRUNCATE TABLE Cowboys.etl.CRMProcess_RecentCustData

DECLARE @Client VARCHAR(50)
SET @Client = 'cowboys' --updateme


SELECT x.dimcustomerid, MAX(x.maxtransdate) maxtransdate, x.team
INTO #tmpTicketSales
	FROM (

		SELECT dc.dimcustomerid, MAX(fts.CreatedDate) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc (NOLOCK)
			INNER JOIN ods.SGDW_DimClients sgdw ON dc.AccountId = sgdw.dcClientCode
			INNER JOIN dbo.FactTicketSales_V2 fts
				ON sgdw.dcClientGUID = fts.ETL__SSID_SG_client_guid AND dc.SourceSystem = 'SG'
		WHERE YEAR(fts.CreatedDate)>= YEAR(DATEADD(YEAR, -2, GETDATE()))
		GROUP BY dc.dimcustomerid

			UNION

		SELECT dc.dimcustomerid, MAX(fts.CreatedDate) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc (NOLOCK)
			INNER JOIN dbo.FactTicketSales_V2 fts
				ON dc.AccountId = fts.ETL__SSID_TM_acct_id AND dc.SourceSystem = 'TM'
				INNER JOIN dbo.DimSeason_V2 ds ON fts.DimSeasonId = ds.DimSeasonId
		WHERE dc.CustomerType='Primary' AND YEAR(fts.CreatedDate)>= YEAR(DATEADD(YEAR, -2, GETDATE()))
		AND ds.IsActive = 1
		GROUP BY dc.dimcustomerid

			UNION

		SELECT dc.dimcustomerid, MAX(n.upd_Datetime) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc
			INNER JOIN ods.TM_Note n
				ON n.acct_id = dc.AccountId
		WHERE dc.CustomerType='Primary' AND CONVERT(DATE,n.upd_Datetime)>= DATEADD(YEAR, -2, GETDATE())
		GROUP BY dc.DimCustomerId

		) x
		GROUP BY x.dimcustomerid, x.team



INSERT INTO etl.CRMProcess_RecentCustData (dimcustomerid, SSID, MaxTransDate, Team)
SELECT a.dimcustomerid, SSID, [MaxTransDate], Team FROM [#tmpTicketSales] a 
INNER JOIN dbo.[vwDimCustomer_ModAcctId] b ON [b].[DimCustomerId] = [a].[DimCustomerId]

GO
