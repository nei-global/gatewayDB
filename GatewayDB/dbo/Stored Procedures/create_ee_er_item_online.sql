


CREATE PROCEDURE [dbo].[create_ee_er_item_online]
		@er_id_auto int,
		@benefit_Type varchar(50),
		--@category int,
		@from_date date,
		@to_date date,
		@description varchar(3500) = NULL,  --varchar(max)
		@amount decimal(18,2),
		@currency varchar(5) = 'USD',
		@status bit = 0
	 
AS
BEGIN
SET XACT_ABORT ON;  
BEGIN TRY  

BEGIN TRANSACTION;
INSERT INTO syn_ee_er_item_online(
		er_id,  --er_id_auto
		benefit_type,
		category,
		from_dt,  --from_date
		to_dt,  --to_date
		description,
		amount,
		currency,
		isSubmitted,  -- status,
		create_date,
		last_updated
		)
    VALUES (
		@er_id_auto,
		@benefit_Type,
		1,
		@from_date,
		@to_date,
		@description,
		@amount,
		@currency,
		@status,
		getdate(),
		getdate())

    UPDATE  syn_ee_er_online
	SET Total_Exp=isnull(Total_Exp,0)+@amount
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
