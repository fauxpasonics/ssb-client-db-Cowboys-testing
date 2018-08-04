CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimRestrictionGroups]
(
[drgLocalId] [int] NOT NULL,
[drgHolderCompanyId] [int] NOT NULL,
[drgGuid] [uniqueidentifier] NOT NULL,
[drgIssuerCompanyId] [int] NOT NULL,
[drgName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drgDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drgOrdinal] [int] NOT NULL,
[drgOrganizationUnitGuid] [uniqueidentifier] NULL,
[drgVisibleBySubordinates] [bit] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimRestrictionGroups] ADD CONSTRAINT [PK__Sync_tem__19364FD25E54C275] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
