

-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 4th, 2017
-- Description:	Populate login_status with default values
-- =============================================

CREATE PROCEDURE [dbo].[populate_login_status] 
AS
BEGIN
	PRINT ' Populate login_status with default values'

	PRINT ' Remove all rows from login_status'
	-- Remove all rows from login_status
	DELETE FROM [dbo].[login_status];

	PRINT ' Start inserting values into login_status'
	-- Insert values into login_status
	-- Active Status
	INSERT INTO [dbo].[login_status]
		([status],[description],[message])
	VALUES ('ACT','Active',NULL)
	-- Inactive Status
	INSERT INTO [dbo].[login_status]
		([status],[description],[message])
	VALUES ('INACT','Inactive','You are currently inactive in our system. Please contact NEI to update your information by calling 1-800-533-7353 or emailing webhelp@neirelo.com.')

	PRINT ' Finshed'


END


