CREATE TABLE [ods].[SGDW_DimDeliveryMethods]
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
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimDeliveryMethods] ON [ods].[SGDW_DimDeliveryMethods]
GO
