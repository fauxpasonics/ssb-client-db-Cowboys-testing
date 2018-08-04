SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]
AS
BEGIN


-- TM
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'ods.vw_TM_LoadDimCustomer', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- Listrak
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_Listrak', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- FanClub
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_CowboysFanClub', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- CRM Accounts
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_DynamicsAccount', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- CRM Contacts
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_DynamicsContact', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- DC Merchandise
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_Merchandise', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

-- Data Uploader
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'api.UploadDimCustomerStaging', @LogLevel = '2', @DropTemp = '1', @IsDataUploaderSource = '1'

-- FanManager
--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_FanManager', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- Personicx (moved to data uploader)
--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_Personicx', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- TM Tours (this is static data)
--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_TM_Tours', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- Flag Inactive Data Uploader Records
EXEC etl.sp_DimCustomer_FlagInactiveUploaderRecords

-- SeatGeek
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Cowboys', @LoadView = 'etl.vw_Load_DimCustomer_SeatGeek', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';



END;






GO
