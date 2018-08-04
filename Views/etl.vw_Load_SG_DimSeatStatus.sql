SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_SG_DimSeatStatus]
AS

SELECT
  drGUID AS ETL__SSID
, drGUID AS ETL__SSID_SG_restriction_guid
, drRestrictionDescription AS SeatStatusName
, drRestrictionDescription AS SeatStatusDesc
, CASE WHEN drRestrictionDescription LIKE '%Kill%' THEN 1 ELSE 0 END AS IsKill
--SELECT *
FROM ods.SGDW_DimRestrictions



GO
