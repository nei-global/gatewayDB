

/*
* 04/26/18 snc: created

*/

CREATE PROCEDURE [dbo].[create_gg_notification_log_addl_val]	
	    @notification_id int,
		@notification_addl_type_id int,
		@value varchar(255)
	 
AS
BEGIN
	
	INSERT INTO gg_notification_log_addl_val(
		  [notification_id] 
		  ,[notification_addl_type_id]
		  ,[value]
			)
	VALUES (		
		@notification_id,
		@notification_addl_type_id,
		@value)
		

	
END



