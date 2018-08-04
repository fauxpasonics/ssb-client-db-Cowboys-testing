SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_SGDW_FactTickets_Active]
AS

WITH MaxUpdated
AS (
	SELECT ft.ftEventGuid, ft.ftSeatIdInAreaMap, ft.ftAreaGuid
		, ft.ftTicketStatus, MAX(ft.ftActualDate) MaxActualDate
	FROM ods.SGDW_FactTickets ft (NOLOCK)
	WHERE ft.ftTicketStatus = 1
	GROUP BY ft.ftEventGuid, ft.ftSeatIdInAreaMap
		, ft.ftAreaGuid, ft.ftTicketStatus
)

SELECT ft.*
FROM ods.SGDW_FactTickets ft (NOLOCK)
JOIN MaxUpdated mu
	ON ft.ftAreaGuid = mu.ftAreaGuid
	AND ft.ftSeatIdInAreaMap = mu.ftSeatIdInAreaMap
	AND ft.ftEventGuid = mu.ftEventGuid
	AND ft.ftTicketStatus = mu.ftTicketStatus
	AND ft.ftActualDate = mu.MaxActualDate








GO
