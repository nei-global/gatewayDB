-- =============================================
-- Author:		Meredith Alder
-- Create date: 12/21/2018
-- Description:	User story 8897: delete record in co_email table
-- =============================================
create procedure dbo.delete_co_email
	@co_email_id int
AS
BEGIN
	
	delete
	from co_email
	where co_email_id = @co_email_id
		
END
