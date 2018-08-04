CREATE TABLE [ods].[SGDW_DimRestrictions]
(
[drLocalId] [int] NOT NULL,
[drGUID] [uniqueidentifier] NOT NULL,
[drHolderCompanyId] [int] NOT NULL,
[drIssuerCompanyId] [int] NOT NULL,
[drRestrictionType] [int] NOT NULL,
[drRestrictionDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[drExclusive] [bit] NOT NULL,
[drCountWithAvailableSeats] [bit] NULL,
[drOrganizationUnitGuid] [uniqueidentifier] NULL,
[drVisibleBySubordinates] [bit] NOT NULL,
[drExcludeLockFromCapacity] [bit] NULL,
[drRestrictionGroupGuid] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimRestrictions] ON [ods].[SGDW_DimRestrictions]
GO
