CREATE TABLE [etl].[Sync_Config_Integrations]
(
[IntegrationId] [uniqueidentifier] NOT NULL,
[IsEnabled] [bit] NOT NULL,
[Client] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Activity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MaxParallelThreads] [int] NOT NULL,
[DataFlowRetryAttempts] [int] NOT NULL,
[DataFlowRetryWaitSeconds] [int] NOT NULL,
[SourceConnString] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DestinationConnString] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoggingConnString] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FailOnError] [bit] NOT NULL,
[UseUtcTime] [bit] NOT NULL,
[SourceTimeZone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfigDoc] [xml] NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
