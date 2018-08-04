CREATE TABLE [ods].[Snapshot_Listrak_ContactRest_FieldValues]
(
[Listrak_ContactRest_FieldValuesSK] [int] NOT NULL IDENTITY(1, 1),
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SegmentationFieldGroupId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SegmentationFieldId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SegmentationFieldValue] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_ContactRest_FieldValues] ADD CONSTRAINT [PK__Snapshot__324518DB2D53788C] PRIMARY KEY CLUSTERED  ([Listrak_ContactRest_FieldValuesSK])
GO
