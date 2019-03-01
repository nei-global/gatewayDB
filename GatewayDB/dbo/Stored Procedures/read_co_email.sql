


-- =============================================
-- Author:		Meredith Alder
-- Create date: 12/21/2018
-- Description:	User story 8897: read from co_email table
-- =============================================
CREATE PROCEDURE [dbo].[read_co_email]
	@cono int,
	@nei_site varchar(1),
	@form_name varchar(50) = null
AS
BEGIN
	select co_email_id as EmailId,
		cono as Cono,
		form_name as FormName,
		email_address as EmailAddress
	from co_email
	where cono = @cono and
		nei_site = @nei_site and
		(@form_name is null or form_name = @form_name) and
		(begin_date <= getdate()) and
		(end_date is null or end_date >= getdate())
		
END
