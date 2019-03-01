




/*
* 11/02/2018 mkb:created
*/ 

CREATE PROC [dbo].[delete_travel_request]
	@id int

AS 
BEGIN 

SET NOCOUNT ON;

--DECLARE @id int
--	SET @id = (SELECT id FROM travel_request WHERE tid = @tid AND trip_no = @trip_no)

BEGIN TRY
	BEGIN TRANSACTION
		
		DELETE
		FROM travel_request_info
		WHERE travel_request_id = @id

		DELETE
		FROM travel_request_member
		WHERE travel_request_id = @id

		DELETE    
		FROM   travel_request
		WHERE  (id = @id)
			
	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	DECLARE @Message varchar(max) = ERROR_MESSAGE()

	RAISERROR(N'Error nr: %d. Message: %s', 1, 16, @@ERROR, @Message)
	ROLLBACK TRANSACTION
END CATCH

END


