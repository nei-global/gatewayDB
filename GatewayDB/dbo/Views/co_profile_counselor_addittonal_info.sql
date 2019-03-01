

/* 
05/01/18 JET Created TFS -5280
*/


CREATE view [dbo].[co_profile_counselor_addittonal_info]
as 
  SELECT
		eep.tid As UserId,
		c.cono As CompanyId,
		c.name As CompanyName,
		c.web_er As ExpenseReport,
		eep.first_name As FirstName,
		eep.last_name As LastName,
		c.orig_rcpt As OrigRcpt, 
		eep.move_type As MoveType,
		c.orig_rcpt_intl As OrigRcptIntl,
		c.paid_thru_pay As PaidThruPay,
		l.preferred_email As PreferedEmail,
		orig_home_phone As HomePhone,
		cnslr2.user_code as UserCode,
		cnslr2.first_name as cnslr_FirstName,
		cnslr2.last_name as cnslr_LastName,
		cnslr2.title as cnslr_Title,
		cnslr2.email as cnslr_Email,
		cnslr2.phone ascnslr_Phone
   FROM co_company c
   INNER JOIN ee_profile eep
		ON c.cono = LEFT(eep.tid,charindex('-',eep.tid)-1)
   LEFT JOIN ee_profile_online eepl
		ON eep.tid = eepl.tid
   INNER JOIN login l
		ON eep.tid = l.user_name
	LEFT JOIN dbo.counselor cnslr 
		ON eep.ae = cnslr.user_code
	LEFT JOIN dbo.counselor cnslr2 
		ON cnslr2.user_code = cnslr.sae_initials;


