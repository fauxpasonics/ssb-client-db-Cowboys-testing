SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Listrak_Campaigns]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[CampaignID]) [CampaignID_K]
	,CONVERT(NVARCHAR(100),[ListID]) [ListID]
	,CONVERT(NVARCHAR(255),[CampaignName]) [CampaignName]
	,CONVERT(INT,[CampaignMessageCount]) [CampaignMessageCount]
FROM [src].[Listrak_CampaignCollection] WITH (NOLOCK)
GO
