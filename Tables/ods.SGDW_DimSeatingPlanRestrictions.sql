CREATE TABLE [ods].[SGDW_DimSeatingPlanRestrictions]
(
[dsprLocalId] [int] NOT NULL,
[dsprHolderCompanyId] [int] NOT NULL,
[dsprGuid] [uniqueidentifier] NOT NULL,
[dsprSeatingPlanGuid] [uniqueidentifier] NOT NULL,
[dsprAreaGuid] [uniqueidentifier] NOT NULL,
[dsprLastUpdateDateTime] [datetime] NOT NULL,
[dsprSeatRestrictionsData] [varbinary] (1) NULL,
[dsprSeatRestrictionOriginators] [varbinary] (1) NULL,
[dsprQuantitativeRestrictions] [xml] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
