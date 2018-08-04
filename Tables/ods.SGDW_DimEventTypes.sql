CREATE TABLE [ods].[SGDW_DimEventTypes]
(
[detLocalId] [int] NOT NULL,
[detGuid] [uniqueidentifier] NOT NULL,
[detHolderCompanyId] [int] NOT NULL,
[detIssuerCompanyId] [int] NULL,
[detName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[detDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[detStartTime] [datetime] NULL,
[detEndTime] [datetime] NULL,
[detPriority] [int] NULL,
[detExternalReference] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[detIsActive] [bit] NULL,
[detOrganizationUnitGuid] [uniqueidentifier] NULL,
[detVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimEventTypes] ON [ods].[SGDW_DimEventTypes]
GO
