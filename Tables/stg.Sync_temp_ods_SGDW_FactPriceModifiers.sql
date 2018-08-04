CREATE TABLE [stg].[Sync_temp_ods_SGDW_FactPriceModifiers]
(
[fpmLocalId] [int] NOT NULL,
[fpmHolderCompanyId] [int] NOT NULL,
[fpmTransactLocalId] [int] NOT NULL,
[fpmIdInTransaction] [int] NOT NULL,
[fpmIssuerCompanyId] [int] NULL,
[fpmTransactNum] [int] NULL,
[fpmTransactGuid] [uniqueidentifier] NULL,
[fpmPriceModifierGuid] [uniqueidentifier] NULL,
[fpmItemGuid] [uniqueidentifier] NULL,
[fpmAmount] [money] NULL,
[fpmPriceModifierDefinitionGuid] [uniqueidentifier] NULL,
[fpmParentGuid] [uniqueidentifier] NULL,
[fpmType] [int] NULL,
[fpmInsertionSign] [tinyint] NULL,
[fpmIsIncluded] [bit] NULL,
[fpmShiftGuid] [uniqueidentifier] NULL,
[fpmSalePointGuid] [uniqueidentifier] NULL,
[fpmTillGuid] [uniqueidentifier] NULL,
[fpmUserGuid] [uniqueidentifier] NULL,
[fpmRegistrationLevelEnum] [int] NULL,
[fpmApplicationChannel] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpmClientGuid] [uniqueidentifier] NULL,
[fpmRecoAccountGuid] [uniqueidentifier] NULL,
[fpmActualDate] [datetime] NULL,
[fpmBusinessDate] [datetime] NULL,
[fpmItemIdInTransaction] [int] NULL,
[fpmParentPriceModifierIdInTransaction] [int] NULL,
[fpmEntityType] [int] NULL,
[fpmEntityGuid] [uniqueidentifier] NULL,
[fpmEntityId] [int] NULL,
[fpmCommissionType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fpmSaleModeGuid] [uniqueidentifier] NULL,
[fpmBusinessCategoryGuid] [uniqueidentifier] NULL,
[fpmOnBehalfOfAccountGuid] [uniqueidentifier] NULL,
[fpmPayEffectivenessEnum] [int] NULL,
[fpmForwardTransactionGuid] [uniqueidentifier] NULL,
[fpmIdInForwardTransaction] [int] NULL,
[fpmBackwardTransactionGuid] [uniqueidentifier] NULL,
[fpmIdInBackwardTransaction] [int] NULL,
[fpmMasterItemGuid] [uniqueidentifier] NULL,
[fpmOrganizationGuid] [uniqueidentifier] NULL,
[fpmPriceEffectivenessEnum] [int] NULL,
[fpmDefinedValueTypeEnum] [int] NULL,
[fpmDefinedValue] [decimal] (19, 4) NULL,
[fpmIsPresentAsIncluded] [bit] NULL,
[fpmTotalAmount] [money] NULL,
[fpmTaxAmount] [money] NULL,
[fpmPaidByItemIdInTransaction] [int] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_FactPriceModifiers] ADD CONSTRAINT [PK__Sync_tem__19364FD2370AD230] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
