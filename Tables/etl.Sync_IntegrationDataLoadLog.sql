CREATE TABLE [etl].[Sync_IntegrationDataLoadLog]
(
[LogId] [int] NOT NULL,
[Integrationid] [uniqueidentifier] NOT NULL,
[DataLoadId] [uniqueidentifier] NOT NULL,
[BatchId] [uniqueidentifier] NOT NULL,
[ExtractStartDate] [datetime] NOT NULL,
[ExtractEndDate] [datetime] NULL
)
GO
