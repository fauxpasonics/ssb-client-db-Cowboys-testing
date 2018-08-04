CREATE TABLE [etl].[Sync_Config_Tasks]
(
[TaskId] [uniqueidentifier] NOT NULL,
[IsEnabled] [bit] NOT NULL,
[ExecutionOrder] [int] NULL,
[TaskName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TaskType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TaskSettingsReferenceId] [uniqueidentifier] NULL,
[TaskSettings] [xml] NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
