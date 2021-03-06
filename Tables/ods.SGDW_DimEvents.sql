CREATE TABLE [ods].[SGDW_DimEvents]
(
[devLocalId] [int] NOT NULL,
[devHolderCompanyId] [int] NOT NULL,
[devIssuerCompanyId] [int] NOT NULL,
[devGuid] [uniqueidentifier] NOT NULL,
[devEventDate] [datetime] NULL,
[devGlobalName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devEventActualDate] [datetime] NULL,
[devAssociatedDate] [datetime] NULL,
[devShowGuid] [uniqueidentifier] NULL,
[devHallVersionGuid] [uniqueidentifier] NULL,
[devRemark] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devOrganizationUnitGuid] [uniqueidentifier] NULL,
[devAclSchemeId] [int] NULL,
[devSaleStatus] [int] NULL,
[devEventTypeGuid] [uniqueidentifier] NULL,
[devShowOwnerGuid] [uniqueidentifier] NULL,
[devLedgerGuid] [uniqueidentifier] NULL,
[devProjectIdentifierGuid] [uniqueidentifier] NULL,
[devExtendedData1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData5] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData6] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData7] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData8] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData9] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devExtendedData10] [datetime] NULL,
[devExtendedData11] [datetime] NULL,
[devExtendedData12] [datetime] NULL,
[devExtendedData13] [datetime] NULL,
[devExtendedData14] [datetime] NULL,
[devExtendedData15] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[devSalesTargetValue] [money] NULL,
[devShowPromoterGuid] [uniqueidentifier] NULL,
[devShowOrganizerGuid] [uniqueidentifier] NULL,
[devPromoterPriceListIdForRegularTickets] [uniqueidentifier] NULL,
[devPromoterPriceListIdForSubsTickets] [uniqueidentifier] NULL,
[devShowMinutes] [int] NULL,
[devCalcPotentialPriceListId] [uniqueidentifier] NULL,
[devBreakMinutes] [int] NULL,
[devEventType1Guid] [uniqueidentifier] NULL,
[devEventType2Guid] [uniqueidentifier] NULL,
[devEventType3Guid] [uniqueidentifier] NULL,
[devEventType4Guid] [uniqueidentifier] NULL,
[devEventType5Guid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimEvents] ON [ods].[SGDW_DimEvents]
GO
