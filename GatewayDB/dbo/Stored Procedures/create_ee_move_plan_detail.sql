







CREATE PROCEDURE [dbo].[create_ee_move_plan_detail]
	   @move_plan_id int,
       @tid varchar(10),
       @complete bit,
       @enable bit
	 
AS
BEGIN
INSERT INTO syn_ee_move_plan_detail(
	   [move_plan_id]
      ,[tid]
      ,[complete]
      ,[enable]
		)
    VALUES (
	   @move_plan_id,
       @tid,
       @complete,
       @enable)

END











