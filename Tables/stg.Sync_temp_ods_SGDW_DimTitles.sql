CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimTitles]
(
[dttlLocalId] [int] NOT NULL,
[dttlGuid] [uniqueidentifier] NOT NULL,
[dttlHolderCompanyId] [int] NOT NULL,
[dttlIssuerCompanyId] [int] NOT NULL,
[dttlGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dttlIsActive] [bit] NOT NULL,
[dttlTypeEnum] [int] NOT NULL,
[dttlOrganizationUnitId] [uniqueidentifier] NULL,
[dttlVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimTitles] ADD CONSTRAINT [PK__Sync_tem__19364FD21275F365] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
