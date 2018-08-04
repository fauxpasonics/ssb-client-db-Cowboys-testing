SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_ContactRest_FieldValues]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) ListID_K
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress_K]
	,CONVERT(NVARCHAR(100),[SegmentationFieldGroupId]) [SegmentationFieldGroupId_K]
	,CONVERT(NVARCHAR(100),[SegmentationFieldId]) [SegmentationFieldId_K]
	,CONVERT(NVARCHAR(1000),[SegmentationFieldValue]) [SegmentationFieldValue]
FROM [src].[Listrak_ContactRest] WITH (NOLOCK)
GO
