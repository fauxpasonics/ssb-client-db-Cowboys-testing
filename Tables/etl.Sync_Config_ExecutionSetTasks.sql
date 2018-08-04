CREATE TABLE [etl].[Sync_Config_ExecutionSetTasks]
(
[ExecutionSetTaskId] [uniqueidentifier] NOT NULL,
[ExecutionSetId] [uniqueidentifier] NOT NULL,
[TaskId] [uniqueidentifier] NOT NULL,
[IsEnabled] [bit] NOT NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
