CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimPriceModifierDefinitions]
(
[dpmLocalId] [int] NOT NULL,
[dpmHolderCompanyId] [int] NOT NULL,
[dpmIssuerCompanyId] [int] NOT NULL,
[dpmPriceModifierGUID] [uniqueidentifier] NOT NULL,
[dpmPriceModifierDesc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dpmPriceModifierTypeEnum] [int] NOT NULL,
[dpmRegistrationLevelEnum] [int] NOT NULL,
[dpmCommissionType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dpmLedgerId] [uniqueidentifier] NULL,
[dpmProjectIdentifierId] [uniqueidentifier] NULL,
[dpmOrganizationUnitGuid] [uniqueidentifier] NULL,
[dpmVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimPriceModifierDefinitions] ADD CONSTRAINT [PK__Sync_tem__19364FD2C7EBF71D] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
