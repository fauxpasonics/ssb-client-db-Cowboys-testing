CREATE TABLE [ods].[SGDW_DimSubscriptions]
(
[dsLocalId] [int] NOT NULL,
[dsGuid] [uniqueidentifier] NOT NULL,
[dsHolderCompanyId] [int] NOT NULL,
[dsCreateDate] [datetime] NOT NULL,
[dsNumber] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsClientGuid] [uniqueidentifier] NOT NULL,
[dsLastInstanceGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimSubscriptions] ON [ods].[SGDW_DimSubscriptions]
GO
