SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_MessageContactActivity]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[MsgID]) [MsgID_K]
	,CONVERT(NVARCHAR(100),[ContactID]) [ContactID_K]
	,CONVERT(NVARCHAR(255),[EmailAddress]) [EmailAddress]
	,CONVERT(DATETIME,[SendDate]) [SendDate]
	,CONVERT(BIT,CASE WHEN Opened = 'False' THEN 0 ELSE 1 END) [Opened]
	,CONVERT(BIT,CASE WHEN [Read] = 'False' THEN 0 ELSE 1 END) [Read]
	,CONVERT(INT,[ClickCount]) [ClickCount]
	,CONVERT(INT,[BounceCount]) [BounceCount]
FROM [src].[Listrak_MessageContactActivity] WITH (NOLOCK)
GO
