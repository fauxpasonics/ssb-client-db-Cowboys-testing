CREATE TABLE [etl].[Sync_Audit]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[BatchId] [uniqueidentifier] NULL,
[Integrationid] [uniqueidentifier] NOT NULL,
[DataLoadId] [uniqueidentifier] NOT NULL,
[SourceCount] [bigint] NULL,
[DestinationCount] [bigint] NULL
)
GO
ALTER TABLE [etl].[Sync_Audit] ADD CONSTRAINT [PK__Sync_Aud__C4EA24452774C69D] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
