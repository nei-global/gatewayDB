




-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 9th, 2017
-- Description:	Copy data into login_security_question and login_security_answer
-- =============================================

CREATE PROCEDURE [dbo].[populate_security_qa] 
AS
BEGIN
	PRINT ' Copy data into login_security_question and login_security_answer'

	PRINT ' Remove all rows from login_security_answer'
	-- Remove all rows from login_security_answer
	DELETE FROM [dbo].[login_security_answer];

	PRINT ' Remove all rows from login_security_question'
	-- Remove all rows from login_security_question
	DELETE FROM [dbo].[login_security_question];

    -- Turn off identity incrementer
	SET IDENTITY_INSERT [dbo].[login_security_question] ON

	PRINT ' Start copying data from securityQuestions to login_security_question'
	-- Copy all rows to login_security_question
	INSERT INTO [dbo].[login_security_question]
		([security_id],[question])
	SELECT [questionID],[questionText]
	FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[securityQuestions];

	-- Set indenty value
	DECLARE @nextidentval smallint;  

	SELECT @nextidentval = MAX(security_id)  
	FROM login_security_question t1;

	DBCC CHECKIDENT ('[login_security_question]', RESEED, @nextidentval);
	-- Turn on identity incrementer
	SET IDENTITY_INSERT [dbo].[login_security_question] OFF

	PRINT ' Finshed loading login_security_question'
	PRINT ' '
	PRINT ' Start copying data from securityQuestions to login_security_answer'
	-- Copy all rows to login_security_question
	INSERT INTO [dbo].[login_security_answer]
		([user_name],[security_id],[response])
	SELECT Distinct [userid],[questionID],[response]
	FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[cfx_TransferSecurityQuestion] sq
		JOIN [dbo].[login] l ON l.user_name =  sq.userid
		JOIN [dbo].[login_security_question] q ON q.security_id = sq.questionID

	PRINT ' Finshed loading login_security_answer'


END





