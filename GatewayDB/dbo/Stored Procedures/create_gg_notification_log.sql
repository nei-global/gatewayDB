

/*
* 04/26/18 snc: created

*/

CREATE PROCEDURE [dbo].[create_gg_notification_log]		
		@notification_type_id int,
		@TID varchar(10),
		@subject varchar(255),
		@recipient varchar(225),
		@copy varchar(255),
		@blind_copy varchar(255),
		@sender varchar(255),
		@body varchar(MAX)
	 
AS
BEGIN
	
	INSERT INTO gg_notification_log(
		  [notification_type_id] 
		  ,[tid]
		  ,[subject]
		  ,[recipient] 
		  ,[copy]
		  ,[blind_copy]
		  ,[sender] --as add_date
		  ,[body] --as [type]
		  ,[sent_date]
			)
	VALUES (		
		@notification_type_id,
		@TID,
		@subject,
		@recipient,
		@copy,
		@blind_copy,
		@sender,
		@body,
		getdate()
		)

	SELECT max(notification_id) FROM gg_notification_log
END



