SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_SG_DimPromo]
AS

SELECT
  dcGuid AS ETL__SSID
, dcGuid AS ETL__SSID_SG_promo_code
, dcName AS PromoName
, dcDescription AS PromoDesc
, dcRedemptionQuantityPerTransaction AS SG_RedemptionQuantityPerTransactions
--SELECT *
FROM ods.SGDW_DimCoupons


GO
