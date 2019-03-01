
/****** 02/16/2018 jtp added update of total_exp in syn_ee_er_online ******/

CREATE PROCEDURE [dbo].[update_ee_er_item_online]
		@item_id int,
		@er_id_auto int,
		@benefit_Type varchar(50) = NULL,
		@category int = NULL,
		@from_date date = NULL,
		@to_date date = NULL,
		@description varchar(3500) = NULL,  --varchar(max)
		@amount decimal(18,2) = NULL,
		@currency varchar(5) = NULL,
		@status bit = NULL
	 
AS
BEGIN
SET XACT_ABORT ON;  
BEGIN TRY  

BEGIN TRANSACTION;
	UPDATE syn_ee_er_item_online
	SET		er_id = ISNULL(@er_id_auto,er_id),  --er_id_auto
			benefit_type = ISNULL(@benefit_Type,benefit_type),
			category = ISNULL(@category,category),
			from_dt = ISNULL(@from_date,from_dt),  --from_date
			to_dt = ISNULL(@to_date,to_dt),  --to_date
			[description] = ISNULL(@description,[description]),
			amount = ISNULL(@amount,amount),
			currency = ISNULL(@currency,currency),
			isSubmitted = ISNULL(@status,isSubmitted),  -- status,
			last_updated = getdate()
	WHERE item_id = @item_id AND er_id = @er_id_auto

    UPDATE  syn_ee_er_online
	SET Total_Exp = (select SUM(amount) from syn_ee_er_item_online where er_id = @er_id_auto)
	WHERE er_id = @er_id_auto

COMMIT TRANSACTION;
SELECT 0;
END TRY

BEGIN CATCH  
	IF (XACT_STATE()) = -1  
    BEGIN  
         ROLLBACK TRANSACTION;  
		 SELECT 1;
    END;  

    -- Test whether the transaction is active and valid.  
    IF (XACT_STATE()) = 1  
    BEGIN  
         COMMIT TRANSACTION;  
		 SELECT 0;
    END;  
END CATCH;  
END






