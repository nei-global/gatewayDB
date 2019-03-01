

/*
*	04/26/18 snc: Created
*/

CREATE PROC [dbo].[read_gg_notification_log_addl_val]
   @notification_id int = NULL
AS 
BEGIN 
 
    SELECT  
		[notification_id] 
		,[notification_addl_type_id]
		,[value]
	FROM [gg_notification_log_addl_val]
    WHERE  (notification_id = @notification_id)
END



