SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_Contact]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress_K]
	,CONVERT(NVARCHAR(100),[ListID]) [ListID_K]
	,CONVERT(NVARCHAR(100),[AttributeID]) [AttributeID_K]
	,CONVERT(NVARCHAR(500),[AttributeValue]) [AttributeValue_K]
FROM [src].[Listrak_GetContact] WITH (NOLOCK)
GO
