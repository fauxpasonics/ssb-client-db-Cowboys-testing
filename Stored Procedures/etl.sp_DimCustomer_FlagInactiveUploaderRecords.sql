SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[sp_DimCustomer_FlagInactiveUploaderRecords]
AS

/*========================================================================================================
	Created By:		Kaitlyn Nelson
	Created Date:	2018-04-04
	Purpose:		The Cowboys regularly upload lists of active Cowboys Fit and Cowboys Club members.
					Any prior members who are not on the most recent upload for each source must be
					set to IsDeleted = 1 in dbo.DimCustomer. Additionally, Cowboys Fit prospects are
					and loaded separately from active members. If a Cowboys Fit prospect was converted
					to an active member (and therefore the prospect matches an active record in MDM),
					the prospect record needs to be set to IsDeleted = 1.

	CHANGE LOG
	2018-06-06	KN:	Removed a bad WHERE clause from the query to create the #Inactive table that was
					limiting the data set to a single SSID. Peer reviewed by Keegan Schmitt on 2018-06-06.
	2018-06-11	KN:	Added logic to flag active records as well as inactive records to correct any records
					that were flagged inaccurately in the past.
========================================================================================================*/


/*================================
			STEP 1
================================*/

-- Find the most recent upload for each source --
SELECT CASE WHEN CustomerStatus = 'Prospect' THEN CONCAT(SourceSystem, '_', CustomerStatus)
		ELSE SourceSystem END AS SourceSystem
	, MAX(RecordCreateDate) UploadDate
INTO #MaxUploadDate
--SELECT *
FROM api.UploadDimCustomerStaging (NOLOCK)
WHERE SourceSystem IN ('CowboysFit', 'CowboysClub')
GROUP BY CASE WHEN CustomerStatus = 'Prospect' THEN CONCAT(SourceSystem, '_', CustomerStatus)
		ELSE SourceSystem END
--SELECT * FROM #MaxUploadDate

-- Identify old records that were not included in the most recent upload for each source --
SELECT DISTINCT dc.DimCustomerId, m.*
INTO #Inactive
FROM dbo.DimCustomer dc (NOLOCK)
JOIN api.UploadDimCustomerStaging u (NOLOCK)
	ON dc.SourceSystem = u.SourceSystem
	AND dc.SSID = u.SSID
LEFT JOIN #MaxUploadDate m (NOLOCK)
	ON u.RecordCreateDate = m.UploadDate
	AND m.SourceSystem = CASE WHEN u.CustomerStatus = 'Prospect' THEN CONCAT(u.SourceSystem, '_', u.CustomerStatus)
								ELSE u.SourceSystem END
WHERE dc.SourceSystem IN ('CowboysFit', 'CowboysClub')
	AND m.SourceSystem IS NULL
--SELECT * FROM #Inactive

-- Identify old records that were not included in the most recent upload for each source --
SELECT DISTINCT dc.DimCustomerId, m.*
INTO #Active
FROM dbo.DimCustomer dc (NOLOCK)
JOIN api.UploadDimCustomerStaging u (NOLOCK)
	ON dc.SourceSystem = u.SourceSystem
	AND dc.SSID = u.SSID
LEFT JOIN #MaxUploadDate m (NOLOCK)
	ON u.RecordCreateDate = m.UploadDate
	AND m.SourceSystem = CASE WHEN u.CustomerStatus = 'Prospect' THEN CONCAT(u.SourceSystem, '_', u.CustomerStatus)
								ELSE u.SourceSystem END
WHERE dc.SourceSystem IN ('CowboysFit', 'CowboysClub')
	AND m.SourceSystem IS NOT NULL
--SELECT * FROM #Inactive

-- Set IsDeleted = 1 for old customers that were not in the most recent upload --
UPDATE dbo.DimCustomer
SET IsDeleted = 1
WHERE DimCustomerId IN (
		SELECT DISTINCT DimCustomerId
		FROM #Inactive
	)

-- Set IsDeleted = 1 for old customers that were not in the most recent upload --
UPDATE dbo.DimCustomer
SET IsDeleted = 0
WHERE DimCustomerId IN (
		SELECT DISTINCT DimCustomerId
		FROM #Active
	)


/*================================
			STEP 2
================================*/

-- Evaluate CowboysFit Prospects and Active records
SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID
	, MAX(CASE WHEN dc.CustomerStatus = 'Prospect' THEN 1 ELSE 0 END) HasProspectRecord
	, MAX(CASE WHEN dc.CustomerStatus = 'Prospect' THEN CAST(dc.CreatedDate AS DATE) ELSE NULL END) ProspectCreatedDate
	, MAX(CASE WHEN dc.CustomerStatus <> 'Prospect' THEN 1 ELSE 0 END) HasActiveRecord
	, MAX(CASE WHEN dc.CustomerStatus <> 'Prospect' THEN CAST(dc.CreatedDate AS DATE) ELSE NULL END) ActiveCreatedDate
INTO #CowboysFit
FROM dbo.DimCustomer dc (NOLOCK)
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerId
WHERE dc.SourceSystem IN ('CowboysFit')
	AND dc.IsDeleted = 0
GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID
--SELECT * FROM #CowboysFit


-- Pull out CowboysFit prospects that have been converted to active members
SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID
INTO #ConvertedProspects
FROM #CowboysFit (NOLOCK)
WHERE HasProspectRecord = 1 AND HasActiveRecord = 1
	AND ActiveCreatedDate >= ProspectCreatedDate

-- Set IsDeleted = 0 for old CowboysFit prospects that have been converted to active members
UPDATE dc
SET dc.IsDeleted = 1
FROM dbo.DimCustomer dc
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerId
JOIN #ConvertedProspects cp (NOLOCK)
	ON ssbid.SSB_CRMSYSTEM_CONTACT_ID = cp.SSB_CRMSYSTEM_CONTACT_ID
WHERE dc.SourceSystem IN ('CowboysFit') AND dc.CustomerStatus = 'Prospect'





GO
