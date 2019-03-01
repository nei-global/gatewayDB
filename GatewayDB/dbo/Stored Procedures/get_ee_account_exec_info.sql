-- =============================================
-- Author:		Dilshad Shaik
-- Create date: 8/22/2018
-- Description:	Get AE and AAE info
-- =============================================
CREATE PROCEDURE dbo.get_ee_account_exec_info 
		@tid varchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

select c.user_code,
       c.title,
       c.description as Name,
       c.phone,
       c.ext,
       c.out_phone as AfterHour,
       c.email as email,
       c.fax,
       ca.description as Assistant,
       ca.user_code as assistantUserCode,
       ca.email as Assistantemail
from ee_profile eep
       left outer join counselor c on eep.ae = c.user_code
       left outer join counselor ca on eep.aae = ca.user_code
where eep.tid = @tid
END
