
-- =============================================
-- Author:		Meredith Alder
-- Create date: 12/21/2018
-- Description:	User story 8897: create record in co_email table
-- =============================================
CREATE procedure [dbo].[create_co_email]
	@cono int,
	@nei_site varchar(1),
	@form_name varchar(50),
	@email_address varchar(150),
	@begin_date date,
	@end_date date
AS
BEGIN
	set nocount on

	if (@begin_date is null)
		set @begin_date = getdate()

	insert into co_email(cono, 
		nei_site, 
		form_name, 
		email_address, 
		begin_date, 
		end_date)
	values(@cono, 
		@nei_site, 
		@form_name, 
		@email_address, 
		@begin_date, 
		@end_date)
		
END
