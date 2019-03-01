-- =============================================
-- Author:		snc
-- Create date: 07/05/2018
-- Description:	Created.
--				Updated | 07/16/2018 | Paras Bhandari | User Story: 5325 | Modified to update password in transfer login table as well.
-- Dependencies:
--		Stored Proc: None.
--		Function: dbo.get_cono
--		Synoym: syn_transfer_login_pwdlog; syn_transfer_login
-- 
-- 2018-07-23 JET 6779 - adding "Set XACT_ABORT ON;"	because there is more than one table being updating in the transaction.
-- =============================================


CREATE PROCEDURE [dbo].[create_gg_pwd_log]		
		@userid varchar(10),
		@password varchar(200)	 
AS
BEGIN
	DECLARE @cono varchar(3);
	SET @cono = dbo.get_CONO(@userid)
	
	Set XACT_ABORT ON;	
	BEGIN TRANSACTION;
		-- update current password in transfer_login table with new password. 
		UPDATE [syn_transfer_login]
		SET	[password] = ISNULL(@password,password)
		WHERE [UserId] = @userid;
		 
		--expire existing passwords
		UPDATE syn_transfer_login_pwdLog
		SET		expired = 1
		WHERE userid = @userid and expired = '0'

		--insert new password
		INSERT INTO syn_transfer_login_pwdLog(
			  [cono]
			  ,[userid] --as user_id
			  ,[password] --as [file_name]
			  ,[password_set_date] -- as pwd_date
			  ,[expired] --as add_date

				)
		VALUES (		
			@cono,
			@userid,
			@password,
			getdate(),
			'0')
	
		--only keep the last 12
		DELETE
		FROM syn_transfer_login_pwdLog
		WHERE transfer_login_pwdLog NOT IN 
			(SELECT TOP 12 transfer_login_pwdLog
			 FROM syn_transfer_login_pwdLog
			 WHERE userid = @userid
			 ORDER BY password_set_date DESC)
		AND userid = @userid
	
	COMMIT TRANSACTION;
END






