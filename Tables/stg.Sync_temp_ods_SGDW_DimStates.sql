CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimStates]
(
[dsLocalId] [int] NOT NULL,
[dsGuid] [uniqueidentifier] NOT NULL,
[dsHolderCompanyId] [int] NOT NULL,
[dsIssuerCompanyId] [int] NULL,
[dsName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dsCountryGuid] [uniqueidentifier] NULL,
[dsIsActive] [bit] NOT NULL,
[dsOrganizationUnitGuid] [uniqueidentifier] NULL,
[dsVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimStates] ADD CONSTRAINT [PK__Sync_tem__19364FD273CB97C8] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
