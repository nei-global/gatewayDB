

Create PROC [dbo].[get_ee_er_item_online_list]
    @er_id int
AS 
BEGIN 
/* Stored Procedure to return list of items based on given er_id*/
    SELECT item_id,
	    er_id			as er_id_auto,
		benefit_type,
		category,
        from_dt			as from_date,
        to_dt			as to_date,
        [description],
        amount,
        currency,
        isSubmitted		as [status],
        create_date,
        last_updated
    FROM   syn_ee_er_item_online  
    WHERE  (er_id = @er_id)
END


