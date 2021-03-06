CREATE TABLE [ods].[SGDW_DimClientExtraFields]
(
[dcefLocalId] [int] NOT NULL,
[dcefHolderCompanyId] [int] NOT NULL,
[dcefIssuerCompanyId] [int] NULL,
[dcefClientId] [uniqueidentifier] NOT NULL,
[dcefGlobalStringField] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField1] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField2] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField3] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField4] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField5] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField6] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField7] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefDateTimeField1] [datetime] NULL,
[dcefDateTimeField2] [datetime] NULL,
[dcefStringField8] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField9] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefStringField10] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dcefFloatField11] [float] NULL,
[dcefFloatField12] [float] NULL,
[dcefId] [uniqueidentifier] NULL,
[dcefCustomListField1] [uniqueidentifier] NULL,
[dcefCustomListField2] [uniqueidentifier] NULL,
[dcefCustomListField3] [uniqueidentifier] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__SGDW_DimClientExtraFields] ON [ods].[SGDW_DimClientExtraFields]
GO
