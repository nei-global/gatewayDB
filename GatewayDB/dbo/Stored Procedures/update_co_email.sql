-- =============================================
-- Author:		Meredith Alder
-- Create date: 12/21/2018
-- Description:	User story 8897: update record in co_email table
-- =============================================
CREATE procedure dbo.update_co_email
	@co_email_id int,
	@cono int = null,
	@nei_site varchar(1) = null,
	@form_name varchar(50) = null,
	@email_address varchar(150) = null,
	@begin_date date = null,
	@end_date date = null
AS
BEGIN
	

	update co_email
	set cono = isnull(@cono, cono),
		nei_site = isnull(@nei_site, nei_site),
		form_name = isnull(@form_name, form_name),
		email_address = isnull(@email_address, email_address),
		begin_date = isnull(@begin_date, begin_date),
		end_date = isnull(@end_date, end_date)
	where co_email_id = @co_email_id
	
		
END
