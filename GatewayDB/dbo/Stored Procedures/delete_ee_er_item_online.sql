
/*
TFS - 6068 - JET 06/18/2018 
	Added log Delete Log to:
	
	 [syn_ee_er_item_online]  = [nei_gateway_dev][dbo].[ee_er_item_online]
	 [syn_ee_er_online]  = [nei_gateway_dev][dbo].[ee_er_online_log]

TFS - 6068 - JET 06/26/2018 
	Remove log entry if delete fails.

*/

CREATE PROC [dbo].[delete_ee_er_item_online]
	@item_id int,
	@er_id_auto int

AS

BEGIN 



	INSERT INTO [ee_er_item_online_log] ([item_id],[Er_id],[Benefit_Type],[Category],[From_dt],[To_dt],[Description],[Amount]
				,[Currency],[isSubmitted],[create_date],[last_updated],[delete_date])
		SELECT [item_id],[Er_id],[Benefit_Type],[Category],[From_dt],[To_dt],[Description],[Amount]
           ,[Currency],[isSubmitted],[create_date],[last_updated],GETDATE()
	FROM   [syn_ee_er_item_online]
    WHERE  (item_id = @item_id) AND (er_id = @er_id_auto)
	

    DELETE    
	FROM   syn_ee_er_item_online 
    WHERE  (item_id = @item_id) AND (er_id = @er_id_auto);


	Delete 
	FROM ee_er_item_online_log 
	WHERE (er_id = @er_id_auto) and er_id in (Select er_id from syn_ee_er_item_online)

END
