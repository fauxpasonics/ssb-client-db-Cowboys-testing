CREATE TABLE [etl].[LogEvent]
(
[LogId] [bigint] NOT NULL IDENTITY(1, 1),
[BatchId] [uniqueidentifier] NOT NULL,
[ExecutionId] [uniqueidentifier] NOT NULL,
[EventDate] [datetime] NOT NULL,
[EventLevel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EventSource] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EventCategory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogEvent] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogMessage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogMessageExtended] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceInfo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [etl].[LogEvent] ADD CONSTRAINT [PK_LogEvent] PRIMARY KEY CLUSTERED  ([LogId])
GO
CREATE NONCLUSTERED INDEX [IDX_BatchId] ON [etl].[LogEvent] ([BatchId])
GO
CREATE NONCLUSTERED INDEX [IDX_EventDate] ON [etl].[LogEvent] ([EventDate] DESC)
GO
