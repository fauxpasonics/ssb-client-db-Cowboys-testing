CREATE TABLE [ods].[SGDW_DimUserGroups]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimUserGroups] ON [ods].[SGDW_DimUserGroups]
GO
