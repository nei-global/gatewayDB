

-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 3rd, 2017
-- Description:	Copy data from movePlannerMaster to gg_move_plan
-- =============================================

CREATE PROCEDURE [dbo].[populate_gg_move_plan] 
AS
BEGIN
	PRINT ' Copy data from movePlannerMaster to gg_move_plan'

    -- Turn off identity incrementer
	SET IDENTITY_INSERT [dbo].[gg_move_plan] ON

	PRINT ' Remove all rows from gg_move_plan'
	-- Remove all rows from gg_move_plan
	DELETE FROM [dbo].[gg_move_plan];

	PRINT ' Start copying data from movePlannerMaster to gg_move_plan'
	-- Copy all rows to gg_move_plan
	INSERT INTO [dbo].[gg_move_plan]
		([move_plan_id],[title],[description],[section],[link_anchor],[tab_anchor]
		,[page],[home_owner_old],[home_owner_new],[renter_old],[renter_new],[hhg_order]
		,[no_kids],[no_spouse],[active],[svc_tab_id])
	SELECT [checklistid],[checkListTitle],[checkListDesc],[section],[linkAnchor],[tabAnchor]
		,[page],[h_old],[h_new],[r_old],[r_new],[NEI_hhg_ordered]
		,[noKids],[noSpouse],[active],[serviceTabID]
	FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[movePlannerMaster];

 	-- Set indenty value
	DECLARE @nextidentval smallint;  

	SELECT @nextidentval = MAX(move_plan_id)  
	FROM gg_move_plan t1;

	DBCC CHECKIDENT ('[gg_move_plan]', RESEED, @nextidentval);
	-- Turn on identity incrementer
	SET IDENTITY_INSERT [dbo].[gg_move_plan] OFF

	PRINT ' Finshed'


END


