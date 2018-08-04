SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Listrak_Attributes_CommaSeparated]
AS

WITH Attributes
AS (
		SELECT DISTINCT ListID, AttributeID
		FROM ods.Listrak_Attributes
		WHERE ISNULL(IsRestAPIEnabled, 0) = 1
	)

SELECT DISTINCT b.ListID, 
	SUBSTRING(
		(
			SELECT ','+ a.AttributeID  AS [text()]
			FROM Attributes a
			WHERE a.ListID = b.ListID
			ORDER BY a.ListID
			FOR XML PATH ('')
		), 2, 1000) [Attributes]
FROM Attributes b


GO
