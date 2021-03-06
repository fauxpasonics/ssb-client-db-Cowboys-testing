CREATE TABLE [stg].[TM_FactHeldSeats]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__SSID] [varchar] (51) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_TM_ods_id] [bigint] NULL,
[ETL__SSID_TM_event_id] [int] NULL,
[ETL__SSID_TM_section_id] [int] NULL,
[ETL__SSID_TM_row_id] [int] NULL,
[ETL__SSID_TM_seat_num] [int] NULL,
[ETL__SSID_TM_price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimDateId] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimTimeId] [int] NULL,
[DimTicketCustomerId] [bigint] NULL,
[DimArenaId] [int] NULL,
[DimSeasonId] [int] NULL,
[DimItemId] [int] NULL,
[DimEventId] [int] NULL,
[DimPlanId] [int] NULL,
[DimPriceLevelId] [int] NULL,
[DimPriceTypeId] [int] NULL,
[DimPriceCodeId] [int] NULL,
[DimLedgerId] [int] NULL,
[DimSeatId_Start] [int] NULL,
[DimSeatStatusId] [int] NULL,
[DimRepId] [int] NULL,
[DimSalesCodeId] [int] NULL,
[DimPlanTypeId] [int] NULL,
[DimTicketTypeId] [int] NULL,
[DimSeatTypeId] [int] NULL,
[DimTicketClassId] [int] NULL,
[IsReserved] [bit] NULL,
[HeldDateTime] [datetime] NULL,
[QtySeat] [int] NULL,
[SubTotal] [decimal] (20, 6) NULL,
[Fees] [decimal] (18, 6) NULL,
[Taxes] [decimal] (18, 6) NULL,
[Total] [decimal] (18, 6) NULL,
[TM_eip_pricing] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_price] [decimal] (18, 6) NULL,
[TM_printed_price] [decimal] (18, 6) NULL,
[TM_pc_ticket] [decimal] (18, 6) NULL,
[TM_pc_tax] [decimal] (18, 6) NULL,
[TM_pc_licfee] [decimal] (18, 6) NULL,
[TM_pc_other1] [decimal] (18, 6) NULL,
[TM_pc_other2] [decimal] (18, 6) NULL,
[TM_pc_other3] [decimal] (18, 6) NULL,
[TM_pc_other4] [decimal] (18, 6) NULL,
[TM_pc_other5] [decimal] (18, 6) NULL,
[TM_pc_other6] [decimal] (18, 6) NULL,
[TM_pc_other7] [decimal] (18, 6) NULL,
[TM_pc_other8] [decimal] (18, 6) NULL,
[TM_tax_rate_a] [decimal] (18, 6) NULL,
[TM_tax_rate_b] [decimal] (18, 6) NULL,
[TM_tax_rate_c] [decimal] (18, 6) NULL,
[TM_pricing_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_block_full_price] [decimal] (18, 6) NULL,
[TM_block_purchase_price] [decimal] (18, 6) NULL,
[TM_orig_price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_comp_code] [int] NULL,
[TM_comp_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_disc_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_disc_amount] [decimal] (18, 6) NULL,
[TM_surchg_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_surchg_amount] [decimal] (18, 6) NULL,
[TM_direction] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_quality] [int] NULL,
[TM_attribute] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_aisle] [int] NULL,
[TM_buy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_tag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_consignment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_group_flag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_group_sales_id] [int] NULL,
[TM_group_sales_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_group_sales_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_order_num] [bigint] NULL,
[TM_order_line_item] [bigint] NULL,
[TM_request_line_item] [bigint] NULL,
[TM_usr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_datetime] [datetime] NULL,
[TM_rerate_surchg_on_acct_chg] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_sales_source_id] [int] NULL,
[TM_sales_source_date] [datetime] NULL,
[TM_request_source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_section_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_section_sort] [int] NULL,
[TM_row_sort] [int] NULL,
[TM_row_index] [int] NULL,
[TM_block_id] [int] NULL,
[TM_config_id] [int] NULL,
[TM_print_ticket_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_sell_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_ticket_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_ticket_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_flex_plan_event_ids] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_plan_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_parent_plan_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_acct_rep_id] [int] NULL,
[TM_contract_id] [int] NULL,
[TM_grouping_id] [int] NULL,
[TM_other_info_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_9] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_other_info_10] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_prev_loc_id] [int] NULL,
[TM_reserved_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_release_datetime] [datetime] NULL,
[TM_hold_source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_invoice_id] [bigint] NULL,
[TM_invoice_date] [datetime] NULL,
[TM_invoice_due_date] [datetime] NULL,
[TM_ticket_type_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_comp_approved_by] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_comp_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_offer_id] [int] NULL,
[TM_offer_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_merchant_id] [bigint] NULL,
[TM_merchant_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_merchant_color] [int] NULL,
[TM_auto_disc_code_list] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_man_surchg_code_list] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_sell_location_id] [int] NULL,
[TM_section_name_right] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_row_barcode_index] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_row_barcode_index_high] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_barcode_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_barcode_season_key] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_barcode_event_slot_min] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_barcode_event_slot_max] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_barcode_seatcode_adjustment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_access_control_system_ip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_access_control_system_port] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_seat_code_low] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_seat_code_high] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_digit_server_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_im_mode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_comp_requested_by] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_membership_cust_membership_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_used_cust_membership_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_membership_id_for_membership_event] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_membership_number_domain_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_cust_membership_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_sell_rule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_report_block_purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_held_seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_action] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_auto_surchg_code_list] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_man_disc_code_list] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_rerate_disc_on_acct_chg] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[TM_FactHeldSeats] ADD CONSTRAINT [PK__TM_FactH__C4EA24454DB84C65] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
