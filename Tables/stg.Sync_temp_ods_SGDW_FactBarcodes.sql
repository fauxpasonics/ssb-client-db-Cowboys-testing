CREATE TABLE [stg].[Sync_temp_ods_SGDW_FactBarcodes]
(
[fbLocalId] [int] NOT NULL,
[fbHolderCompanyId] [int] NOT NULL,
[fbGuid] [uniqueidentifier] NOT NULL,
[fbTicketGuid] [uniqueidentifier] NULL,
[fbAccessControlSystemGuid] [uniqueidentifier] NOT NULL,
[fbReferencedEntityGuid] [uniqueidentifier] NOT NULL,
[fbReferencedEntityName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fbBarcodeGuid] [uniqueidentifier] NULL,
[fbBarcode] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fbEventGuid] [uniqueidentifier] NULL,
[fbScanDate] [datetime] NOT NULL,
[fbActionEnum] [tinyint] NOT NULL,
[fbIsFirstScan] [bit] NOT NULL,
[fbScannerGuid] [uniqueidentifier] NULL,
[fbTurnstileGuid] [uniqueidentifier] NULL,
[fbScanSucceeded] [bit] NOT NULL,
[fbFailureReasonCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fbFailureReasonDescr] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fbIsVirtualScan] [bit] NOT NULL,
[fbSameShowOriginalEventGuid] [uniqueidentifier] NULL,
[fbClientGuid] [uniqueidentifier] NULL,
[fbShowGuid] [uniqueidentifier] NULL,
[fbJointMembershipMemberTypeEnum] [int] NULL,
[fbJointMembershipMemberGuid] [uniqueidentifier] NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_SGDW_FactBarcodes] ADD CONSTRAINT [PK__Sync_tem__19364FD20BB1CCE3] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
