SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_MessageSummary]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ListID]) [ListID_K]
	,CONVERT(NVARCHAR(100),[MessageID]) [MessageID_K]
	,CONVERT(NVARCHAR(500),[Subject]) [Subject]
	,MAX(CONVERT(DATETIME,[SendDate])) [SendDate_K]
	,CONVERT(INT,[DeliverCount]) [DeliverCount]
	,CONVERT(INT,[RemoveCount]) [RemoveCount]
	,CONVERT(DECIMAL(18,6),[RemovePercent]) [RemovePercent]
	,CONVERT(INT,[OpenCount]) [OpenCount]
	,CONVERT(DECIMAL(18,6),[OpenPercent]) [OpenPercent]
	,CONVERT(INT,[ReadCount]) [ReadCount]
	,CONVERT(DECIMAL(18,6),[ReadPercent]) [ReadPercent]
	,CONVERT(INT,[ClickCount]) [ClickCount]
	,CONVERT(INT,[ClickerCount]) [ClickerCount]
	,CONVERT(INT,[RepeatClickerCount]) [RepeatClickerCount]
	,CONVERT(INT,[NewClickerCount]) [NewClickerCount]
	,CONVERT(DECIMAL(18,6),[ClickerPercent]) [ClickerPercent]
	,CONVERT(DECIMAL(18,6),[OrderTotal]) [OrderTotal]
	,CONVERT(INT,[ConversionCount]) [ConversionCount]
	,CONVERT(DECIMAL(18,6),[AverageOrderValue]) [AverageOrderValue]
FROM [src].[Listrak_ReportListMessageActivity] WITH (NOLOCK)
GROUP BY ListID, MessageID, Subject, DeliverCount, RemoveCount, RemovePercent
	, OpenCount, OpenPercent, ReadCount, ReadPercent, ClickCount, ClickerCount
	, RepeatClickerCount, NewClickerCount, ClickerPercent, OrderTotal
	, ConversionCount, AverageOrderValue
GO
