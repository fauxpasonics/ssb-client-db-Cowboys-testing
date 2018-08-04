CREATE TABLE [stg].[Sync_temp_ods_SGDW_DimSubscriptions]
(
[dsLocalId] [int] NOT NULL,
[dsGuid] [uniqueidentifier] NOT NULL,
[dsHolderCompanyId] [int] NOT NULL,
[dsCreateDate] [datetime] NOT NULL,
[dsNumber] [nvarchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dsClientGuid] [uniqueidentifier] NOT NULL,
[dsLastInstanceGuid] [uniqueidentifier] NOT NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_DimSubscriptions] ADD CONSTRAINT [PK__Sync_tem__19364FD2837AA5F8] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
