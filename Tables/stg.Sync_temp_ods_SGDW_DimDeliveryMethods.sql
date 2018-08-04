CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimDeliveryMethods]
(
[ddmLocalId] [int] NOT NULL,
[ddmGuid] [uniqueidentifier] NOT NULL,
[ddmHolderCompanyId] [int] NOT NULL,
[ddmIssuerCompanyId] [int] NOT NULL,
[ddmName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ddmDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ddmOrdinal] [int] NOT NULL,
[ddmOrganizationUnitGuid] [uniqueidentifier] NULL,
[ddmLedgerGuid] [uniqueidentifier] NULL,
[ddmProjectGuid] [uniqueidentifier] NULL,
[ddmIsActive] [bit] NOT NULL,
[ddmAclSchemeId] [int] NULL,
[ddmVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimDeliveryMethods] ADD CONSTRAINT [PK__Sync_tem__19364FD289C6CE15] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
