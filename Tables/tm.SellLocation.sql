CREATE TABLE [tm].[SellLocation]
(
[id] [bigint] NOT NULL IDENTITY(1, 1),
[InsertDate] [datetime] NULL,
[UpdateDate] [datetime] NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL,
[sell_location_id] [int] NULL,
[sell_location_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sell_location_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sell_location_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[outlet_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[org_id] [int] NULL,
[active] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[protected] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sort_order] [int] NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [datetime] NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [datetime] NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArcYear] [int] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tm__SellLocation] ON [tm].[SellLocation]
GO
