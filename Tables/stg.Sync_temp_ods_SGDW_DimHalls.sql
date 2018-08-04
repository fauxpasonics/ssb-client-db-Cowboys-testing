CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimHalls]
(
[dhLocalId] [int] NOT NULL,
[dhHolderCompanyId] [int] NOT NULL,
[dhIssuerCompanyId] [int] NOT NULL,
[dhGuid] [uniqueidentifier] NOT NULL,
[dhName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dhVenueGuid] [uniqueidentifier] NULL,
[dhIsActive] [bit] NULL,
[dhOrganizationUnitGuid] [uniqueidentifier] NULL,
[dhAclSchemeId] [int] NULL,
[dhVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimHalls] ADD CONSTRAINT [PK__Sync_tem__19364FD24A7D0FC0] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
