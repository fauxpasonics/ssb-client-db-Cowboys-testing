SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[SG_Delete_GAInventory_OverCapacity]
AS


-------- Load GA Inventory --------
WHILE 1=1
BEGIN
	

	IF EXISTS (SELECT * FROM dbo.sysobjects
				WHERE name = 'Delete_GAInventory_OverCapacity'
				AND xtype = 'U')
	DROP TABLE etl.Delete_GAInventory_OverCapacity

	SELECT cap.DimEventId, cap.Capacity, ISNULL(fi.InventoryCount, 0) InventoryCount
	INTO etl.Delete_GAInventory_OverCapacity
	FROM (
			SELECT dEvent.DimEventId, SUM(sien.dsieCapacity) Capacity
			FROM ods.SGDW_DimSeatsInfo_Event_New sien (NOLOCK)
			JOIN dbo.DimEvent_V2 dEvent (NOLOCK)
				ON sien.dsieEventGuid = dEvent.ETL__SSID_SG_event_guid
			WHERE dsieIsGA = 1
				AND dEvent.Config_IsFactInventoryEligible = 1
			GROUP BY dEvent.DimEventId
		) cap
	LEFT JOIN (
			SELECT fi.DimEventId, COUNT(*) InventoryCount, MAX(fi.FactInventoryId) FactInventoryID
			FROM dbo.FactInventory_V2 fi (NOLOCK)
			group BY fi.DimEventId
		) fi ON fi.DimEventId = cap.DimEventId
	WHERE ISNULL(fi.InventoryCount, 0) > cap.Capacity

	IF @@ROWCOUNT = 0
		BREAK
	ELSE
		BEGIN
			
			DELETE FROM dbo.FactInventory_V2
			WHERE FactInventoryId IN (
					SELECT DISTINCT FactInventoryId
					FROM etl.Delete_GAInventory_OverCapacity
				)
			;

		END
		;

	CONTINUE
	;

END
;




GO
