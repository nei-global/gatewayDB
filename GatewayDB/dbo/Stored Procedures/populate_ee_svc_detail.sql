

-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 3rd, 2017
-- Description:	Copy data from serviceDetail to ee_move_plan_detail
-- =============================================

CREATE PROCEDURE [dbo].[populate_ee_svc_detail] 
AS
BEGIN
	PRINT ' Copy data from serviceDetail to ee_svc_detail'

	PRINT ' Remove all rows from ee_svc_detail'
	-- Remove all rows from ee_svc_detail
	DELETE FROM [dbo].[ee_svc_detail];

	PRINT ' Start copying data from movePlannerDetail to ee_svc_detail'
	-- Copy all rows to ee_svc_detail
	INSERT INTO [dbo].[ee_svc_detail]
		([svc_cart_id],[tid],[order_date])
	SELECT [serviceCartID],[TID],[orderDate]
	FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[serviceDetail]

	PRINT ' Finshed'


END


