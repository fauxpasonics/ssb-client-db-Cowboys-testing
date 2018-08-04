CREATE TABLE [etl].[Sync_Config_DataLoads]
(
[DataLoadId] [uniqueidentifier] NOT NULL,
[IsEnabled] [bit] NOT NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Client] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataLoadName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DestinationTableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataTableSourceObject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataTableDefinition] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StageTableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QueryExtract] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessKeysCreateUniqueIndex] [bit] NOT NULL,
[BusinessKeys] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LoadProcedure] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RetryOptions] [xml] NULL,
[LoggingOptions] [xml] NULL,
[AlertOptions] [xml] NULL,
[DataFlowOptions] [xml] NULL,
[MergeOptions] [xml] NULL,
[DeleteOptions] [xml] NULL,
[AuditOptions] [xml] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
