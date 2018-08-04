CREATE TABLE [etl].[Sync_Config_IntegrationExecutionSets]
(
[IntegrationExecutionSetId] [uniqueidentifier] NOT NULL,
[IntegrationId] [uniqueidentifier] NOT NULL,
[ExecutionSetId] [uniqueidentifier] NOT NULL,
[IsEnabled] [int] NULL,
[ExecutionOrder] [int] NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
