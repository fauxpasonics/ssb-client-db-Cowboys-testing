CREATE TABLE [etl].[Sync_Batch]
(
[BatchId] [uniqueidentifier] NOT NULL,
[IntegrationId] [uniqueidentifier] NOT NULL,
[BatchStartDate] [datetime] NOT NULL,
[BatchEndDate] [datetime] NULL,
[BatchError] [bit] NULL,
[OnDemand] [bit] NOT NULL,
[OnDemandReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecutedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BatchNotes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
