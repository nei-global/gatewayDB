


/*
* 10/30/18 snc: created
* 12/04/18 mla: increased length of disclaimer field, set default values for begin_date and inactive
* 
*/

CREATE PROCEDURE [dbo].[create_gg_form_disclaimer]		
		@cono int,
		@nei_site varchar(1),
		@form_name varchar(50),
		@disclaimer varchar(max),
		@begin_date date,
		@end_date date,
		@inactive bit
	 
AS
BEGIN

	if (@begin_date is null)
		set @begin_date = getdate()

	if (@inactive is null)
		set @inactive = 0
	
	INSERT INTO gg_form_disclaimer(
		   [cono]
		  ,[nei_site] 
		  ,[form_name] 
		  ,[disclaimer]
		  ,[begin_date] 
		  ,[end_date] 
		  ,[inactive]
			)
	VALUES (		
		@cono,
		@nei_site,
		@form_name,
		@disclaimer,
		@begin_date,
		@end_date,
		@inactive
		)

END




