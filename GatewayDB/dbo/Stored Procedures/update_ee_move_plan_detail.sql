


CREATE PROCEDURE [dbo].[update_ee_move_plan_detail]
	   @move_plan_id int,
       @tid varchar(10),
       @complete bit = NULL,
       @enable bit = NULL
	 
AS
BEGIN

	UPDATE syn_ee_move_plan_detail
	SET	move_plan_id = ISNULL(@move_plan_id,move_plan_id)
      ,tid = ISNULL(@tid,tid)
      ,complete = ISNULL(@complete,complete)
      ,enable = ISNULL(@enable,enable)
	WHERE move_plan_id = @move_plan_id and tid = @tid

END	




