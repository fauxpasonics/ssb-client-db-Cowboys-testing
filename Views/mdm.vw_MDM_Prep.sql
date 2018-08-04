SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [mdm].[vw_MDM_Prep]
AS

SELECT dc.dimcustomerid, sth.STH, cc.CC, sg.SG
FROM dbo.dimcustomer dc (NOLOCK)
LEFT JOIN (
		SELECT DISTINCT
       dc.DimCustomerId,
       1 AS 'STH'
FROM dbo.FactTicketSales_V2 f
    JOIN Cowboys.dbo.DimTicketCustomer_V2 dtc (NOLOCK)
        ON f.DimTicketCustomerId = dtc.DimTicketCustomerId
    JOIN Cowboys.dbo.DimCustomer dc (NOLOCK)
        ON dtc.ETL__SourceSystem = dc.SourceSystem
           AND dtc.ETL__SSID = dc.SSID
    JOIN dbo.DimEvent_V2 e (NOLOCK)
        ON f.DimEventId = e.DimEventId
    JOIN dbo.DimSeason_V2 sh (NOLOCK)
        ON sh.DimSeasonId = e.DimSeasonId
    JOIN Cowboys.dbo.DimPriceLevel_V2 pl (NOLOCK)
        ON f.DimPriceLevelId = pl.DimPriceLevelId
    JOIN Cowboys.dbo.DimPriceType_V2 pt (NOLOCK)
        ON f.DimPriceTypeId = pt.DimPriceTypeId
WHERE e.EventDate >= DATEADD(YEAR, -1, GETDATE())
      AND dtc.ETL__SourceSystem = 'SG'
      AND
      (
          (
              PriceLevelName IN ( 'A', 'B', 'C', 'D' )
              AND PriceTypeName NOT LIKE '%optum%'
          )
          OR
          (
              PriceLevelName IN ( 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N' )
              AND PriceTypeName NOT LIKE '%FAA%'
          )
          OR (PriceLevelName IN ( 'O', 'P' ))
          OR
          (
              PriceTypeName LIKE '%optum%'
              AND PriceTypeName NOT LIKE '%Suite%'
          )
          OR
          (
              PriceTypeName LIKE '%owner%'
              AND PriceTypeName NOT LIKE '%Suite%'
          )
          OR
          (
              PriceTypeName LIKE '%FAA%'
              AND PriceTypeName NOT LIKE '%Suite%'
          )
          OR (PriceTypeName IN ( 'NEW Suite AI', 'NEW Suite SRO', 'RENEWAL Suite AI', 'RENEWAL Suite SRO' ))
          OR (pt.PriceTypeName IN ( 'NEW Suite AI Optum', 'NEW Suite AI Optum SRO', 'RENEWAL Suite AI Optum SRO',
                                    'RENEWAL Suite AI Optum'
                                  )
             )
      )
) sth ON dc.dimcustomerid = sth.dimcustomerid
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'CC'
			FROM dbo.DimCustomer (NOLOCK)
			WHERE SourceSystem = 'CowboysClub'
		   ) cc ON dc.dimcustomerid = cc.dimcustomerid
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'SG'
		FROM	dbo.FactTicketSales_V2 f
    JOIN Cowboys.dbo.DimTicketCustomer_V2 dtc (NOLOCK)
        ON f.DimTicketCustomerId = dtc.DimTicketCustomerId
    JOIN Cowboys.dbo.DimCustomer dc (NOLOCK)
        ON dtc.ETL__SourceSystem = dc.SourceSystem
           AND dtc.ETL__SSID = dc.SSID
    JOIN dbo.DimEvent_V2 e (NOLOCK)
        ON f.DimEventId = e.DimEventId
    JOIN dbo.DimSeason_V2 sh (NOLOCK)
        ON sh.DimSeasonId = e.DimSeasonId
    JOIN Cowboys.dbo.DimPriceCode_V2 pc (NOLOCK) ON pc.DimPriceCodeId = f.DimPriceCodeId
			WHERE (pc.PriceCode LIKE '%SZ' OR LEN(pc.PriceCode) = 1) --AND  YEAR(sh.SeasonYear) = 2018
			) sg ON dc.DimCustomerId = sg.DimCustomerId

GO
