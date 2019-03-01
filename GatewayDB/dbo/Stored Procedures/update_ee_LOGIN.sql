

/****** 
* 05/25/18 JET: CREATED
* 06/26/18 JET: changed to use renamed synonym
* 10/19/18 mkb: removed transaction, updated to standards

******/

CREATE PROCEDURE [dbo].[update_ee_LOGIN]
	@user_name varchar(150),
	@password varchar(150) = NULL,
	@attempt_no int = NULL,
	@force_reset bit = NULL,
	@opt_in date = NULL,
	@last_login datetime = NULL,
	@2_factor_phone varchar(25)= NULL,
	@status varchar(5) =NULL,
	@user_type varchar(4) = NULL,
	@preferred_email varchar(150) = NULL,
	@reset_pin int = NULL,
	@reset_pin_date datetime = NULL,
	@reset_pin_phone varchar(25) = NULL,
	@login_token varchar(75) = NULL,
	@login_token_date datetime = NULL
AS
BEGIN

UPDATE syn_transfer_login
	SET	   
		[password] = ISNULL(@password,[password])
		,attempt_no = ISNULL(@attempt_no,attempt_no)
		,force_reset = ISNULL(@force_reset,force_reset)
		,last_login = ISNULL(@last_login,last_login)
		,auth2FactorPhone = ISNULL(@2_factor_phone,auth2FactorPhone)
		,email = ISNULL(@preferred_email,email)
		,[login_token] = ISNULL(@login_token,[login_token])
		,login_token_date = ISNULL(@login_token_date,login_token_date)
	WHERE UserId = @user_name

END

