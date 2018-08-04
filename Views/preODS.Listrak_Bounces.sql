SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_Bounces]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) MessageID_K
	,CONVERT(NVARCHAR(100),[ContactID]) [ContactID_K]
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddres_K]
	,CONVERT(NVARCHAR(255),[BounceReason]) [BounceReason_K]
	,CONVERT(NVARCHAR(255),[BounceDetail]) [BounceDetail_K]
	,CONVERT(DATETIME,[BounceDate]) [BounceDate_K]
	,CONVERT(INT,[BounceCount]) [BounceCount_K]
FROM [src].[Listrak_ReportRangeMessageContactBounces] WITH (NOLOCK)
GO
