CREATE TABLE [ods].[SGDW_DimCountries]
(
[dcnLocalId] [int] NOT NULL,
[dcnGuid] [uniqueidentifier] NOT NULL,
[dcnHolderCompanyId] [int] NOT NULL,
[dcnIssuerCompanyId] [int] NULL,
[dcnName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dcnIsActive] [bit] NOT NULL,
[dcnOrder] [int] NOT NULL,
[dcnProviderComponentName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcnIBANCountryGuid] [uniqueidentifier] NULL,
[dcnOrganizationUnitGuid] [uniqueidentifier] NULL,
[dcnVisibleBySubordinates] [bit] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimCountries] ON [ods].[SGDW_DimCountries]
GO
