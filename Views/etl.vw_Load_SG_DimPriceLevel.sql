SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_SG_DimPriceLevel]
AS

SELECT 
  pl.dplGuid AS ETL__SSID
, pl.dplGuid AS ETL__SSID_SG_pricelevel_guid
, pl.dplName AS PriceLevelName
, pl.dplName AS PriceLevelDesc
-- SELECT *
FROM ods.SGDW_DimPriceLevels pl (NOLOCK)



GO
