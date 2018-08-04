SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_SG_DimItem]
AS

SELECT
  ditGuid AS ETL__SSID
, ditGuid AS ETL__SSID_SG_itemtype_id
, ditNumber AS ItemCode
, ditName AS ItemName
, ditName AS ItemDesc
, CAST(ditName AS NVARCHAR(25)) AS ItemType
, -1 AS DimSeasonId
-- SELECT *
FROM ods.SGDW_DimItemTypes (NOLOCK)

GO
