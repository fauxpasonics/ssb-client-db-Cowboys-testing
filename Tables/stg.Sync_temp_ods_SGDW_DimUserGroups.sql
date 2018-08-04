CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimUserGroups]
(
[dugLocalId] [int] NOT NULL,
[dugGuid] [uniqueidentifier] NOT NULL,
[dugHolderCompanyId] [int] NOT NULL,
[dugGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dugIsActive] [bit] NULL,
[dugAllowSellNonAllocatedSeats] [bit] NULL,
[dugDescription] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dugCreationDate] [datetime] NULL,
[dugCreationAuditId] [bigint] NULL,
[dugLastModifiedDate] [datetime] NULL,
[dugLastModifiedAuditId] [bigint] NULL,
[dugCustomerAssociationId] [uniqueidentifier] NULL,
[dugBypassSubscriptionPriceLevelEnfrcement] [bit] NULL,
[dugOrganizationUnitGuid] [uniqueidentifier] NULL,
[dugVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimUserGroups] ADD CONSTRAINT [PK__Sync_tem__19364FD2C03F0C33] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
