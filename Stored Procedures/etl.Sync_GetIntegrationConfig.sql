SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Sync_GetIntegrationConfig]
(
	@IntegrationId NVARCHAR(50),
	@LiveQuery BIT = 1
)

AS
BEGIN


IF (@LiveQuery = 0)
BEGIN

	SELECT ConfigDoc
	FROM etl.Sync_Config_Integrations
	WHERE IntegrationId = @IntegrationId AND IsEnabled = 1

END

ELSE
BEGIN

SELECT ExecutionSettings.IntegrationId
		, ExecutionSettings.Client, ExecutionSettings.Activity, ExecutionSettings.MaxParallelThreads
		, ExecutionSettings.DataFlowRetryAttempts, ExecutionSettings.DataFlowRetryWaitSeconds
		, ExecutionSettings.SourceConnString, ExecutionSettings.DestinationConnString, ExecutionSettings.LoggingConnString
		, CASE WHEN ExecutionSettings.FailOnError = 1 THEN 'true' ELSE 'false' END FailOnError
		, CASE WHEN ExecutionSettings.UseUtcTime = 1 THEN 'true' ELSE 'false' END UseUtcTime
		, ExecutionSettings.SourceTimeZone

	, (

		SELECT ExecutionSets.ExecutionSetId, ExecutionSets.ExecutionSetName
		, CASE WHEN ExecutionSets.IsEnabled = 1 AND IntegrationExecutionSets.IsEnabled = 1 THEN 'true' ELSE 'false' END IsEnabled
		, ExecutionSets.ExecutionSetType
		, CASE WHEN ExecutionSets.FailOnError = 1 THEN 'true' ELSE 'false' END FailOnError
		, ISNULL(IntegrationExecutionSets.ExecutionOrder, 999) ExecutionOrder
		, (
				SELECT Tasks.TaskId, Tasks.TaskName, tasks.TaskType
				, CASE WHEN Tasks.IsEnabled = 1 THEN 'true' ELSE 'false' END IsEnabled
				, CASE WHEN Tasks.TaskType = 'ExecuteSql' THEN tasks.TaskSettings ELSE NULL END ExecuteSql
				, Tasks.ExecutionOrder
				, (
					SELECT DataLoad.DataLoadId
					, CASE WHEN DataLoad.IsEnabled = 1 THEN 'true' ELSE 'false' END IsEnabled
					, DataLoad.SourceSystem
					, DataLoad.Client
					, DataLoad.DataLoadName
					, DataLoad.DestinationTableName
					, DataLoad.DataTableSourceObject
					, DataLoad.DataTableDefinition
					, DataLoad.StageTableName
					, DataLoad.QueryExtract
					, DataLoad.BusinessKeysCreateUniqueIndex
					, DataLoad.BusinessKeys									
					, DataLoad.LoadProcedure
					, DataLoad.RetryOptions
					, DataLoad.LoggingOptions
					, DataLoad.AlertOptions
					, DataLoad.DataFlowOptions
					, DataLoad.MergeOptions
					, DataLoad.DeleteOptions
					, DataLoad.AuditOptions
					FROM etl.Sync_Config_DataLoads DataLoad
					WHERE Tasks.TaskSettingsReferenceId = DataLoad.DataLoadId
					FOR XML PATH ('DataLoad'), TYPE
				)
				--, (
				--	SELECT 
				--		DataLoad.DataLoadId
				--		, DataLoad.DataLoadName
				--		, (DataLoad.PackageLocation + DataLoad.PackageName + '.dtsx') DataFlowFile 
				--		, DataLoad.SqlExtractBase DataFlowSqlExtract
				--		, DataLoad.IncrementalDateField
				--		, DataLoad.LoadProcedure PostDataFlowProcedure
				--		, CASE WHEN DataLoad.IsIncrementalEnabled = 1 THEN 'true' ELSE 'false' END IsIncrementalEnabled
				--		, CASE WHEN DataLoad.IsDeleteEnabled = 1 THEN 'true' ELSE 'false' END IsDeleteEnabled
				--		, DataLoad.DeleteType
				--		, DataLoad.DeleteCountCheckGrouping
				--		, DataLoad.BusinessKeys
				--		, DataLoad.DestinationTable
				--		, DataLoad.StageTable
				--	FROM etl.CI_Config_DataLoads DataLoad
				--	WHERE Tasks.DataLoadId = DataLoad.DataLoadId
				--	FOR XML PATH ('DataLoad'), TYPE
				--)
				--, (
				--	SELECT 
				--		ExecuteSql.ExecuteSqlId
				--		, ExecuteSql.Name
				--		, ExecuteSql.ConnectionStringName
				--		, ExecuteSql.SqlStatement
				--	FROM etl.CI_Config_ExecuteSql ExecuteSql
				--	WHERE Tasks.ExecuteSqlId = ExecuteSql.ExecuteSqlId
				--	FOR XML PATH ('ExecuteSql'), TYPE
				--)
				FROM etl.Sync_Config_Tasks Tasks
				INNER JOIN etl.Sync_Config_ExecutionSetTasks ExecutionSetTasks ON Tasks.TaskId = ExecutionSetTasks.TaskId
				WHERE ExecutionSets.ExecutionSetId = ExecutionSetTasks.ExecutionSetId AND ExecutionSetTasks.IsEnabled = 1
				ORDER BY Tasks.ExecutionOrder
				FOR XML PATH ('Task'), ROOT ('Tasks'), TYPE
		)
		FROM etl.Sync_Config_ExecutionSets ExecutionSets
		INNER JOIN etl.Sync_Config_IntegrationExecutionSets IntegrationExecutionSets ON ExecutionSets.ExecutionSetId = IntegrationExecutionSets.ExecutionSetId
		WHERE ExecutionSettings.IntegrationId = IntegrationExecutionSets.IntegrationId
		ORDER BY IntegrationExecutionSets.ExecutionOrder
		FOR XML PATH ('ExecutionSet'), ROOT ('ExecutionSets'), TYPE

	)
	FROM etl.Sync_Config_Integrations ExecutionSettings
	WHERE ExecutionSettings.IntegrationId = @IntegrationId AND ExecutionSettings.IsEnabled = 1
	FOR XML PATH ('SyncSettings'), TYPE

END

END







GO
