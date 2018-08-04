SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_SG_DimSalesCode]
AS

SELECT dsmGuid AS ETL__SSID
	, dsmGuid AS ETL__SSID_SG_salemode_guid
	, dsmName AS SalesCodeName
	, dsmDescription AS SalesCodeDesc
	, sm.dsmBusinessCategories AS SalesCodeClass
FROM ods.SGDW_DimSaleModes sm (NOLOCK)

GO
