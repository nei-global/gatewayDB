



-- =============================================
-- Author:	Greg Miller
-- =============================================
CREATE PROCEDURE [dbo].[read_ee_move_plan_detail] 
	   @move_plan_id int,
       @tid varchar(10)
AS
BEGIN
	SELECT [move_plan_id]
      ,[tid]
      ,[complete]
      ,[enable] 
	FROM syn_ee_move_plan_detail 
	WHERE move_plan_id = @move_plan_id and tid = @tid;
END




