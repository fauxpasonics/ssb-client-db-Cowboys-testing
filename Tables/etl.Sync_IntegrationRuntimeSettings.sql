CREATE TABLE [etl].[Sync_IntegrationRuntimeSettings]
(
[SettingId] [int] NOT NULL,
[Integrationid] [uniqueidentifier] NOT NULL,
[RuntimeSettings] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StartDateRange] [datetime] NULL,
[EndDateRange] [datetime] NULL,
[IsProcessed] [bit] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL
)
GO
