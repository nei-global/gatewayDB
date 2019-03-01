-- =============================================
-- Author:		Sushil Joshi
-- Create date: <01/24/2018>
-- Description:	<Retrieve Assisant Account Ex based on tid>
-- =============================================

CREATE PROCEDURE [dbo].[get_counselor_Assistant_Accounts_ex] 
	@tid varchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

--	SELECT * FROM counselor WHERE user_code =  (SELECT aae FROM ee_profile WHERE tid = @tid)
    SELECT cc.user_code,cc.backup_title as title, cc.description as Name, cc.phone, cc.backup_email as email  FROM counselor cc
	inner join
	dbo.ee_profile eep ON cc.user_code = eep.aae
	WHERE eep.tid=@tid

END