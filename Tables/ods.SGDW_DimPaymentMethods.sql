CREATE TABLE [ods].[SGDW_DimPaymentMethods]
(
[dpmLocalId] [int] NOT NULL,
[dpmHolderCompanyId] [int] NOT NULL,
[dpmIssuerCompanyId] [int] NULL,
[dpmGuid] [uniqueidentifier] NOT NULL,
[dpmName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dpmLedgerGuid] [uniqueidentifier] NULL,
[dpmTypeEnum] [int] NULL,
[dpmSystemName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dpmOrganizationUnitGuid] [uniqueidentifier] NULL,
[dpmVisibleBySubordinates] [bit] NOT NULL,
[dpmProjectIdentifierGuid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimPaymentMethods] ON [ods].[SGDW_DimPaymentMethods]
GO
