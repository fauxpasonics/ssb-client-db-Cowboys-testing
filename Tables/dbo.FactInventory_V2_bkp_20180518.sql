CREATE TABLE [dbo].[FactInventory_V2_bkp_20180518]
(
[FactInventoryId] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__UpdatedDate] [datetime] NOT NULL,
[ETL__SSID_TM_event_id] [int] NULL,
[ETL__SSID_TM_section_id] [int] NULL,
[ETL__SSID_TM_row_id] [int] NULL,
[ETL__SSID_TM_seat] [int] NULL,
[DimArenaId] [int] NOT NULL,
[DimSeasonId] [int] NOT NULL,
[DimEventId] [int] NOT NULL,
[DimSeatId] [int] NOT NULL,
[DimSeatStatusId] [int] NOT NULL,
[SeatValue] [decimal] (18, 6) NULL,
[FactTicketSalesId] [bigint] NULL,
[FactAttendanceId] [bigint] NULL,
[FactTicketActivityId_Resold] [bigint] NULL,
[FactTicketActivityId_Tranferred] [bigint] NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FactAvailSeatsId] [bigint] NULL,
[FactHeldSeatsId] [bigint] NULL,
[ETL__SSID_SG_event_guid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_SG_sector_guid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_SG_seat_guid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
