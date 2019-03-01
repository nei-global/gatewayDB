

-- =============================================
-- Author:		Paras Bhandari
-- Create date: 07/06/2018
-- Description:	Added as part of User Story 5325. Checks if current password is valid, new password is not in last 12 history.
-- Dependencies:
--		Stored Proc: dbo.read_gg_pwd_log
-- Modified: 
-- 07/27/2018 mla01 added "where expired = 0" to the "SELECT count(*) FROM @returnset" subquery so an expired password won't be identified as current
-- =============================================
CREATE PROCEDURE [dbo].[check_gg_password] 
	-- Add the parameters for the stored procedure here
	@tid VARCHAR(10),
	@newPassword VARCHAR(150),
	@currentPassword VARCHAR(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @current_password_match bit = 0; 
	DECLARE @new_password_in_history bit = 1;
	DECLARE @returnset table (cono int,
		user_id varchar(25),
		password varchar(150),
		pwd_date datetime,
		expired bit)

	INSERT INTO @returnset(cono, user_id, password, pwd_date, expired)
	EXEC dbo.read_gg_pwd_log @userid = @tid, @password = @currentPassword; 

	-- If count is 1, current password matches.
	IF (SELECT count(*) FROM @returnset where expired = 0) = 1 BEGIN
		SET @current_password_match = 1;
		
		DELETE FROM @returnset;

		INSERT INTO @returnset(cono, user_id, password, pwd_date, expired)
		EXEC dbo.read_gg_pwd_log @userid = @tid, @password = @newPassword;

		-- If count is 0, new password is not in history.
		IF (SELECT count(*) FROM @returnset) = 0 BEGIN
			SET @new_password_in_history = 0;
		END;		
	END;	

	SELECT @tid 'tid', @current_password_match 'current_password_match', @new_password_in_history 'new_password_in_history';
END
