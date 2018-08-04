CREATE TABLE [tmarc].[CustAttrib]
(
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attrib_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArcYear] [int] NULL,
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[CustAttrib] ADD CONSTRAINT [PK__CustAttr__C4EA244576EC9292] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
