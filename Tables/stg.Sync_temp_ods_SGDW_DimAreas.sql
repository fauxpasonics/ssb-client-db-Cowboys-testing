CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimAreas]
(
[daLocalId] [int] NOT NULL,
[daHolderCompanyId] [int] NOT NULL,
[daIssuerCompanyId] [int] NOT NULL,
[daGuid] [uniqueidentifier] NOT NULL,
[daName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[daHallGuid] [uniqueidentifier] NULL,
[daStandGuid] [uniqueidentifier] NULL,
[daExternalReference] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[daDefaultOrdinal] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimAreas] ADD CONSTRAINT [PK__Sync_tem__19364FD2F2AD721B] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
