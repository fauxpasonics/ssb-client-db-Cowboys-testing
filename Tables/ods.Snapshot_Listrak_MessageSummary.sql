CREATE TABLE [ods].[Snapshot_Listrak_MessageSummary]
(
[Listrak_ReportListMessageActivitySK] [int] NOT NULL IDENTITY(1, 1),
[ListID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendDate] [datetime] NULL,
[DeliverCount] [int] NULL,
[RemoveCount] [int] NULL,
[RemovePercent] [decimal] (18, 6) NULL,
[OpenCount] [int] NULL,
[OpenPercent] [decimal] (18, 6) NULL,
[ReadCount] [int] NULL,
[ReadPercent] [decimal] (18, 6) NULL,
[ClickCount] [int] NULL,
[ClickerCount] [int] NULL,
[RepeatClickerCount] [int] NULL,
[NewClickerCount] [int] NULL,
[ClickerPercent] [decimal] (18, 6) NULL,
[OrderTotal] [decimal] (18, 6) NULL,
[ConversionCount] [int] NULL,
[AverageOrderValue] [decimal] (18, 6) NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Listrak_MessageSummary] ADD CONSTRAINT [PK__Snapshot__98C73EDC15270ECB] PRIMARY KEY CLUSTERED  ([Listrak_ReportListMessageActivitySK])
GO
