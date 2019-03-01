
/*
*	04/26/18 snc: Created
*/

CREATE PROC [dbo].[read_gg_notification_log]
    @tid varchar(10) = NULL,
	@notification_type_id int = NULL
AS 
BEGIN 
 
    SELECT  
	   [notification_id]
      ,[notification_type_id]
      ,[tid]
      ,[subject]
      ,[recipient]
      ,[copy]
      ,[blind_copy]
      ,[sender]
      ,[body]
      ,[sent_date]
  FROM [gg_notification_log]
    WHERE  (tid = @tid) 
			and  (notification_type_id = @notification_type_id)
END


