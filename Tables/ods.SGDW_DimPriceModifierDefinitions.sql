CREATE TABLE [ods].[SGDW_DimPriceModifierDefinitions]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPriceModifierDefinitions] ON [ods].[SGDW_DimPriceModifierDefinitions]
GO
