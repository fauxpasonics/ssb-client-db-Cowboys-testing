SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [etl].[vw_DimTicketCustomer] AS ( SELECT * FROM dbo.DimTicketCustomer_V2 )

GO
