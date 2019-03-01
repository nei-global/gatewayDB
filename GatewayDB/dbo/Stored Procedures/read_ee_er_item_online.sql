


CREATE PROC [dbo].[read_ee_er_item_online]
    @item_id int = NULL,
	@er_id_auto int = NULL
AS 
BEGIN 
	DECLARE @where_clause varchar(50);
 
	IF @item_id IS NULL AND @er_id_auto IS NULL
	BEGIN
		RAISERROR ('item_id and/or er_id_auto required',10, 1)
	END

    SELECT item_id,
	    seeio.er_id			as er_id_auto,
		benefit_type,
		category,
        from_dt			as from_date,
        to_dt			as to_date,
        [description],
        amount,
        currency,
        seeio.isSubmitted		as [status],
        create_date,
        last_updated
    FROM   syn_ee_er_item_online seeio
	Where item_id = CASE WHEN @item_id <> 0 AND @item_id IS NOT NULL THEN @item_id ELSE item_id END 
		AND seeio.er_id = CASE WHEN @er_id_auto <> 0 AND @er_id_auto IS NOT NULL THEN @er_id_auto ELSE seeio.er_id END 
		 
END






