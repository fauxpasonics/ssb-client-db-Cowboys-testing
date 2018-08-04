SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ro].[vw_SyncAudit]
AS

SELECT a.Integrationid, a.DataLoadId, a.SourceCount, a.DestinationCount
, (a.SourceCount - a.DestinationCount) Delta
, CASE 
	WHEN a.SourceCount = 0 AND a.DestinationCount = 0 THEN 0
	WHEN a.SourceCount = 0 THEN NULL 
	ELSE ((a.SourceCount - a.DestinationCount) / CAST(a.SourceCount AS DECIMAL(18,6)) * 100) 
END DeltaPct

, a.ETL__CreatedDate, a.ETL__ID, a.BatchId
, ROW_NUMBER() OVER(PARTITION BY a.IntegrationId, a.DataLoadId ORDER BY ETL__CreatedDate DESC) DataLoadAuditRecency
FROM etl.Sync_Audit a 


GO
