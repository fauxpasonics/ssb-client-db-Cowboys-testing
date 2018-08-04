CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimEventTypes]
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
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimEventTypes] ADD CONSTRAINT [PK__Sync_tem__19364FD267B7AEF0] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
