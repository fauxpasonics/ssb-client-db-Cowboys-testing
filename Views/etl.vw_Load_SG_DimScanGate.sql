SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_Load_SG_DimScanGate]
AS

SELECT t.dtsGuid AS ETL__SSID
	, t.dtsGuid AS ETL__SSID_SG_turnstile_guid
	, t.dtsHallGuid AS SG_hall_guid
	, t.dtsHallVersionGuid AS SG_hallversion_guid
	, t.dtsParentRecordGuid AS SG_parentrecord_guid
	, t.dtsName AS ScanGateCode
	, t.dtsName AS ScanGateName
	, t.dtsDescription AS ScanGateDesc
	, h.dhName AS ScanGateClass
	--SELECT *
FROM ods.SGDW_DimTurnstiles t (NOLOCK)
LEFT JOIN ods.SGDW_DimHalls h (NOLOCK)
	ON t.dtsHallGuid = h.dhGuid
GO
