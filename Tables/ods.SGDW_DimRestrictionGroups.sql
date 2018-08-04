CREATE TABLE [ods].[SGDW_DimRestrictionGroups]
(
[drgLocalId] [int] NOT NULL,
[drgHolderCompanyId] [int] NOT NULL,
[drgGuid] [uniqueidentifier] NOT NULL,
[drgIssuerCompanyId] [int] NOT NULL,
[drgName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drgDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drgOrdinal] [int] NOT NULL,
[drgOrganizationUnitGuid] [uniqueidentifier] NULL,
[drgVisibleBySubordinates] [bit] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimRestrictionGroups] ON [ods].[SGDW_DimRestrictionGroups]
GO
