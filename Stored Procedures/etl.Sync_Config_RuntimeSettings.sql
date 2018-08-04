SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[Sync_Config_RuntimeSettings]
(
	@Integrationid UNIQUEIDENTIFIER
)

AS
BEGIN

	SELECT TOP 1 SettingId, RuntimeSettings
	FROM etl.Sync_IntegrationRuntimeSettings
	WHERE Integrationid = @Integrationid
	AND IsProcessed = 0
	AND GETDATE() BETWEEN ISNULL(StartDateRange,'1900-01-01') AND ISNULL(EndDateRange, '3000-01-01')
	ORDER BY SettingId

END


GO
