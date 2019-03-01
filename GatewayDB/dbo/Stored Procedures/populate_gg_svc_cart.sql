


-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 3rd, 2017
-- Description:	Copy data from serviceCart to gg_svc_cart
-- =============================================

CREATE PROCEDURE [dbo].[populate_gg_svc_cart] 
AS
BEGIN
	PRINT ' Copy data from serviceCart to gg_svc_cart'

    -- Turn off identity incrementer
	SET IDENTITY_INSERT [dbo].[gg_svc_cart] ON

	PRINT ' Remove all rows from gg_svc_cart'
	-- Remove all rows from gg_svc_cart
	DELETE FROM [dbo].[gg_svc_cart];

	PRINT ' Start copying data from serviceCart to gg_svc_cart'
	-- Copy all rows to gg_svc_cart
	INSERT INTO [dbo].[gg_svc_cart]
		([svc_cart_id],[svc_cart_title],[ordinal],[active],[move_plan_id],[sp_type],[email_type_id])
	SELECT [serviceCartID],[serviceCartTitle],[ordinal],[active],[checklistid],[type],[emailType_id]
	FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[serviceCart];

 	-- Set indenty value
	DECLARE @nextidentval smallint;  

	SELECT @nextidentval = MAX(svc_cart_id)  
	FROM gg_svc_cart t1;

	DBCC CHECKIDENT ('[gg_svc_cart]', RESEED, @nextidentval);
	-- Turn on identity incrementer
	SET IDENTITY_INSERT [dbo].[gg_svc_cart] OFF

	PRINT ' Finshed'


END



