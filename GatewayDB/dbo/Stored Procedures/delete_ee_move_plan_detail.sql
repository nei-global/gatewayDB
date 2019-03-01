



CREATE PROC [dbo].[delete_ee_move_plan_detail]
	   @move_plan_id int,
       @tid varchar(10)
AS 
BEGIN 
 
    DELETE    
	FROM   syn_ee_move_plan_detail
    WHERE  (move_plan_id = @move_plan_id) and (tid = @tid)
END





