SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_SG_DimPriceType]
AS

SELECT
  dptPriceTypeGUID AS ETL__SSID
, dptPriceTypeGUID AS ETL__SSID_SG_pricetype_guid
, dptPriceTypeName AS PriceTypeName
, pt.dptPriceTypeName AS PriceTypeDesc
, ptg.dptgName AS PriceTypeClass
, pt.dptPriceTypeGroupId AS SG_pricetype_group_id
--SELECT *
FROM ods.SGDW_DimPriceTypes pt (NOLOCK)
LEFT JOIN ods.SGDW_DimPriceTypeGroups ptg (NOLOCK)
	ON pt.dptPriceTypeGroupId = ptg.dptgGuid


GO
