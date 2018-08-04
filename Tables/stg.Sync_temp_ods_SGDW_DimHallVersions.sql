CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimHallVersions]
(
[dhvLocalId] [int] NOT NULL,
[dhvHolderCompanyId] [int] NOT NULL,
[dhvIssuerCompanyId] [int] NOT NULL,
[dhvGuid] [uniqueidentifier] NOT NULL,
[dhvName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dhvHallGuid] [uniqueidentifier] NULL,
[dhvOrganizationUnitGuid] [uniqueidentifier] NULL,
[dhvVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimHallVersions] ADD CONSTRAINT [PK__Sync_tem__19364FD23EDB6150] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
