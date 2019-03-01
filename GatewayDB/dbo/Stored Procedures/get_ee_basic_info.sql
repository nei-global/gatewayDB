
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 05/04/2018
-- Description:	For given tid we are getting  basic info of transferee.
--				06/11/2018 | Paras Bhandari | User Story 5696. Updated. Selects any transfer login flag to determine authorization to do emulation.
-- 10/24/18		mkb: changed join on counselor cs to eep.et_aud, created at @cono variable
-- 11/13/2018   srj: added emp_id in select statement
-- 11/27/18		mkb: changed alias on cs.email from ETAdminEmail to ETAudEmail
-- =============================================
CREATE PROC [dbo].[get_ee_basic_info]
    @tid VARCHAR(10)
AS 
BEGIN 

DECLARE @et_done_letter_sent_count int,
		@cono int
	SET @et_done_letter_sent_count= (Select Count(*) FROM syn_et_done_letter_sent WITH(NOLOCK) WHERE tid=@tid)
	SET @cono = substring(@tid,1,charindex('-',@tid)-1) 

SELECT
	   eep.tid AS UserId,
	   eep.emp_id as EmployeeId,
	   cc.cono AS CompanyId,
	   cc.name AS CompanyName,
	   cc.web_er AS ExpenseReport,
	   eep.first_name AS FirstName,
	   eep.last_name AS LastName,
	   cc.orig_rcpt AS OrigRcpt, 
	   eep.move_type AS MoveType,
	   cc.orig_rcpt_intl AS OrigRcptIntl,
	   cc.paid_thru_pay AS PaidThruPay,
	   l.preferred_email AS PreferedEmail,
	   eepl.orig_home_phone AS HomePhone,
	   @et_done_letter_sent_count AS EtDoneLtrCnt,
	   cs.email AS ETAudEmail,
	   ISNULL(al.active, 0) AS AnyTransferLoginFlag,
	   eep.nei_phone_nbr AS NeiPhoneNbr
FROM  co_company cc
INNER JOIN ee_profile eep
	ON cc.cono = @cono
LEFT JOIN ee_profile_online eepl  
	ON eep.tid = eepl.tid
LEFT JOIN dbo.nei_login l
	ON eep.tid = l.user_name
LEFT JOIN  counselor cs
	--ON cs.user_code=eep.et_admin
	ON cs.user_code = eep.et_aud
LEFT JOIN syn_anytransferlogins al
	ON eep.tid = al.tid
WHERE eep.tid = @tid  

END



