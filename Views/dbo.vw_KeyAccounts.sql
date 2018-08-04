SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vw_KeyAccounts]
AS 

-------------------------------------------------------------------------------

-- Author name:		Kaitlyn Nelson
-- Created date:	2016
-- Purpose:			Identify records that should not be updated or merged in CRM
-- Copyright © 2016, SSB, All Rights Reserved

-------------------------------------------------------------------------------

-- Modification History --

-- 2018-06-18:		Kaitlyn Nelson
-- Change notes:	Casted NULL placeholders as the correct values so that joins
--					in downstream views will work properly when there are no key accounts

-- Peer reviewed by:
-- Peer review notes:
-- Peer review date:

-- Deployed by:
-- Deployment date:
-- Deployment notes:

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

/*
KEEP THE column structure the same, pulling back ssb_crmsystem_contact_ids as the SSBID for records that need to be withheld. 
Also add the bit for the final 3 columns to denote whether the record should be witheld from Standard, Custom, and Merging.
Having a value of 1 will hold the record out of these updates.
*/

SELECT dimcustomerid
	, ssbid
	, ssid
	, MAX(Withhold_StandardUpdates) Withhold_StandardUpdates
	, MAX(Withhold_CustomUpdate) Withhold_CustomUpdate
	, MAX(Withhold_Merging) Withhold_Merging
FROM (
		SELECT CAST(NULL AS INT) AS DimCustomerId
			, CAST(NULL AS NVARCHAR(255)) AS SSBID
			, CAST(NULL AS NVARCHAR(255)) AS ssid
			, 0 AS Withhold_StandardUpdates
			, 0 AS Withhold_CustomUpdate
			, 1 AS Withhold_Merging 
) z

GROUP BY  dimcustomerid, ssbid, ssid



GO
