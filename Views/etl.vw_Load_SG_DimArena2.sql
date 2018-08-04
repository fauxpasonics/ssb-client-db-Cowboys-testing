SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_SG_DimArena2]
AS

SELECT
 dvGuid AS ETL__SSID
, dvGuid AS ETL__SSID_SG_venue_guid
, NULL AS ArenaCode
, dvName AS ArenaName
, dvName AS ArenaDesc
, NULL AS ArenaClass
, dvTimeZoneId AS Custom_nVarChar_1
--SELECT TOP 100 *
FROM ods.SGDW_DimVenues (NOLOCK)




GO
