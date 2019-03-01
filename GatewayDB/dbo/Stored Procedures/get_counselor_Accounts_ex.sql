
-- =============================================
-- Author:		Sushil Joshi>
-- Create date: <01/24/2018>
-- Description:	<Retrieve AccountExecutive information based on>
--Comments:Modified query by Dilshad Shaik for user story 2490
-- =============================================

CREATE PROCEDURE [dbo].[get_counselor_Accounts_ex] 
	@tid varchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	--SELECT user_code, description, phone, ext, cell_phone, email, fax  FROM counselor WHERE user_code =  (SELECT ae FROM ee_profile WHERE tid = @tid)
	--SELECT cc.user_code,cc.sae_title as title, cc.sae as Name, cc.phone, cc.ext, cc.out_phone as AfterHour, cc.sae_email as email, cc.fax, cc.backup_name as Assistant  FROM counselor cc
	--inner join
	--dbo.ee_profile eep ON cc.user_code = eep.ae
	--WHERE eep.tid=@tid

	--NAS 2/28/2018 hard coding cargill phone number we will remove this after the demo!
	
--SELECT cc.user_code,
--	cc.title as title,
--	cc.description as Name, 
--	'877.804.9021' as phone,
--	cc.ext,
--	  cc.out_phone as AfterHour, 
--	  cc.email as email,
--	   cc.fax,
--	    cc2.description as Assistant  
	--	FROM counselor cc
	--inner join
	--dbo.ee_profile eep ON cc.user_code = eep.ae
	--FROM dbo.ee_profile eep WITH(NOLOCK) 
	--	INNER JOIN dbo.counselor cc WITH(NOLOCK) ON cc.user_code = eep.ae 
	--	INNER JOIN dbo.counselor cc2 WITH(NOLOCK) ON cc2.user_code = eep.aae
	--WHERE eep.tid=@tid

declare @aae varchar(50)
declare @ae varchar(50)
declare @assistant varchar(50)

select @aae=e.aae,@ae=e.ae from ee_profile e where e.tid=@tid
select @assistant= c.description from counselor c where c.user_code=@aae 

SELECT cc.user_code,
	cc.title as title,
	cc.description as Name, 
	cc.phone as phone,
	cc.ext,
	  cc.out_phone as AfterHour, 
	  cc.email as email,
	   cc.fax,	    
		@assistant as Assistant 	
	FROM  dbo.counselor cc WITH(NOLOCK) where cc.user_code = @ae
END


