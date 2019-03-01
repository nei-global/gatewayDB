


-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 4th, 2017
-- Description:	Populate login_user_type with default values
-- =============================================

CREATE PROCEDURE [dbo].[populate_login_user_type] 
AS
BEGIN
	PRINT ' Populate login_user_type with default values'

	PRINT ' Remove all rows from login_user_type'
	-- Remove all rows from login_user_type
	DELETE FROM [dbo].[login_user_type];

	PRINT ' Start inserting values into login_user_type'
	-- Insert values into login_user_type
	-- Transferee
	INSERT INTO [dbo].[login_user_type]
		([user_type],[description])
	VALUES ('EE','Transferee')
	-- Company
	INSERT INTO [dbo].[login_user_type]
		([user_type],[description])
	VALUES ('CO','Company')
	-- Service Partner
	INSERT INTO [dbo].[login_user_type]
		([user_type],[description])
	VALUES ('SP','Service Partner')

	PRINT ' Finshed'


END



