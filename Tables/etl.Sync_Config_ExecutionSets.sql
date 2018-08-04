CREATE TABLE [etl].[Sync_Config_ExecutionSets]
(
[ExecutionSetId] [uniqueidentifier] NOT NULL,
[Client] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Activity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecutionSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsEnabled] [bit] NOT NULL,
[ExecutionSetType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecutionOrder] [int] NULL,
[FailOnError] [bit] NOT NULL,
[MaxParallelThreads] [int] NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
