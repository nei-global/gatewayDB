
/*
TFS - 6068 - JET 06/18/2018 
	Added log Delete Log to:
	
	 [syn_ee_er_item_online]  = [nei_gateway_dev][dbo].[ee_er_item_online]
	 [syn_ee_er_online]  = [nei_gateway_dev][dbo].[ee_er_online_log]

TFS - 6068 - JET 06/26/2018 
	remove log entry if delete fails.
*/

CREATE PROC [dbo].[delete_ee_er_online]
	@er_id_auto int
AS 

BEGIN 


 
IF EXISTS(SELECT 1 FROM syn_ee_er_online WHERE (er_id = @er_id_auto) and IsSubmitted=0)
BEGIN
	--  Add log entries
	INSERT INTO [ee_er_item_online_log] ([item_id],[Er_id],[Benefit_Type],[Category],[From_dt],[To_dt],[Description],[Amount]
				,[Currency],[isSubmitted],[create_date],[last_updated],[delete_date])
		SELECT [item_id],[Er_id],[Benefit_Type],[Category],[From_dt],[To_dt],[Description],[Amount]
           ,[Currency],[isSubmitted],[create_date],[last_updated],GETDATE()
	FROM   [syn_ee_er_item_online]
    WHERE  (er_id = @er_id_auto)

	INSERT INTO [dbo].[ee_er_online_log]
           ([Er_id],[expRpt_nbr],[TID],[DateSubmitted],[Total_Exp],[Total_ReimExp],[Status],[Comments],[pymnt],[address1],[address2],[city],[state],[zip]
		   ,[country],[IsSubmitted],[iagree],[createDate],[lastupdated],[delete_date])
	Select [Er_id],[expRpt_nbr],[TID],[DateSubmitted],[Total_Exp],[Total_ReimExp],[Status],[Comments],[pymnt],[address1],[address2],[city],[state],[zip]
		   ,[country],[IsSubmitted],[iagree],[createDate],[lastupdated],GETDATE() as [delete_date]
	FROM   [syn_ee_er_online]
	WHERE  (er_id = @er_id_auto);
	
	
	-- Delete records

	DELETE    
	FROM   syn_ee_er_item_online
	WHERE  (er_id = @er_id_auto);

	DELETE    
	FROM   syn_ee_er_online
	WHERE  (er_id = @er_id_auto);

	-- If delete fails... delete the log entry
	Delete 
	FROM ee_er_item_online_log 
	WHERE (er_id = @er_id_auto) and er_id in (Select er_id from syn_ee_er_item_online)


	Delete 
	FROM ee_er_online_log 
	WHERE (er_id = @er_id_auto) and er_id in (Select er_id from syn_ee_er_online)
	
	SELECT 0;

END
ELSE
BEGIN
SELECT 1;
END

End







