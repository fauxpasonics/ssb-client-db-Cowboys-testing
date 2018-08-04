CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSaleModes]
(
[dsmLocalId] [int] NOT NULL,
[dsmGuid] [uniqueidentifier] NOT NULL,
[dsmHolderCompanyId] [int] NOT NULL,
[dsmIssuerCompanyId] [int] NULL,
[dsmName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsmDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsmIsActive] [bit] NULL,
[dsmBusinessCategories] [uniqueidentifier] NULL,
[dsmOrganizationUnitGuid] [uniqueidentifier] NULL,
[dsmVisibleBySubordinates] [bit] NOT NULL,
[dsmSaleModeGroupGuid] [uniqueidentifier] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSaleModes] ADD CONSTRAINT [PK__Sync_tem__19364FD2CC893840] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
