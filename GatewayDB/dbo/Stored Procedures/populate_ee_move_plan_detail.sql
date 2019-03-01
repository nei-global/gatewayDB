
-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 3rd, 2017
-- Description:	Copy data from movePlannerDetail to ee_move_plan_detail
-- =============================================

CREATE PROCEDURE [dbo].[populate_ee_move_plan_detail] 
AS
BEGIN
	PRINT ' Copy data from movePlannerDetail to ee_move_plan_detail'

	PRINT ' Remove all rows from ee_move_plan_detail'
	-- Remove all rows from ee_move_plan_detail
	DELETE FROM [dbo].[ee_move_plan_detail];

	PRINT ' Start copying data from movePlannerDetail to ee_move_plan_detail'
	-- Copy all rows to ee_move_plan_detail
	INSERT INTO [dbo].[ee_move_plan_detail]
		([move_plan_id],[tid],[complete],[enable])
	SELECT d.[checklistID],d.[TID],d.[checked],d.[enabled]
	FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[movePlannerDetail] d
		join [ag_listener_test].[NEI_WEBSITE].[dbo].[movePlannerMaster] m ON m.checklistID = d.checklistID

	PRINT ' Finshed'


END

