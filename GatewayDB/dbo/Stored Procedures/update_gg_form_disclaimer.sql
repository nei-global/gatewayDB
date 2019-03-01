







/*
* 10/31/18 snc: created
* 12/04/18 mla: increased length of disclaimer field, set default values for begin_date and inactive
* 
*/
CREATE PROCEDURE [dbo].[update_gg_form_disclaimer]
		@id int,
		@cono int = Null,
		@nei_site varchar(1) = Null,
		@form_name varchar(50) = Null,
		@disclaimer varchar(max) = Null,
		@begin_date date = Null,
		@end_date date = Null,
		@inactive bit = Null
	 
AS
BEGIN

	if (@inactive is null)
		set @inactive = 0

--BEGIN TRANSACTION;

	UPDATE gg_form_disclaimer
	SET		cono = ISNULL(@cono,cono),
			nei_site = ISNULL(@nei_site,nei_site),  
			form_name = ISNULL(@form_name,[form_name]),  
			disclaimer = ISNULL(@disclaimer,[disclaimer]),
			begin_date = ISNULL(@begin_date,[begin_date]),
			end_date = ISNULL(@end_date,[end_date]),
			inactive = ISNULL(@inactive,inactive)
	WHERE id = @id


--COMMIT TRANSACTION;

END











