

-- =============================================
-- Author:		mla
-- Create date: 1/2/2019
-- Description:	US 8016: Get transferee info on login event
-- Modified: US 8842: mla 2/6/2019 converted work ext to string and added logo & employeeId
-- Modified: US 9828: mla 2/18/2019 added a field from company called PaidThruPayrollIntl
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_login]
	@tid varchar(10)
AS
BEGIN

declare @cono int = dbo.get_CONO(@tid)
	
-- we only want to display a link to the evaluation if the most recent evaluation has not been returned
declare @MaxEval int = (select max(eval_nbr) from syn_ee_eval_openlink where tid = @tid group by tid)
declare @Hash varchar(50) = (select [hash] from syn_ee_eval_openlink where tid = @tid and eval_nbr = @MaxEval)
declare @EvalReturned bit = (select case when returned is not null then 1 else 0 end from syn_ee_eval_sent_recd where tid = @tid and eval_nbr = @MaxEval)

-- the data is not unique for all tids, so get the newest row's Id for the join
declare @NewestLoginId int = (select max(trans_id) from syn_transfer_login where tid = @tid)

declare @EtDoneLetterCount int = (select count(*) from syn_et_done_letter_sent where tid = @tid)

-- retrieve the employee ID
declare @EmpId varchar(30)
select @EmpId = emp_id from syn_JOB_RELATED where tid = @tid

select @cono as Cono,
	c.cname as CompanyName,
	lg.file_name as LogoFileName,
	t.tid as Tid,
	t.first_name as FirstName,
	t.last_name as LastName,
	t.policy_nbr as PolicyNbr,
	t.policy_desc as PolicyDesc,
	t.move_type as MoveType,
	t.web_city as WebCity,
	t.web_state as WebState,
	t.web_country as WebCountry,
	l.old_address as OrigAddr,
	l.old_city as OrigCity,
	l.old_state as OrigState,
	l.old_zip as OrigZip,
	l.old_country as OrigCountry,
	l.new_address as DestAddr,
	l.new_city as DestCity,
	l.new_state as DestState,
	l.new_zip as DestZip,
	l.new_country as DestCountry,
	l.home_phone as OrigHomePhone,
	l.new_home_phone as DestHomePhone,
	l.cell_phone as CellPhone,
	l.new_phone as WorkPhone,
	cast(l.new_office_ext as varchar(10)) as WorkExt,
	t.nei_phone_nbr as NeiPhoneNbr,
	l.new_home_email as HomeEmail,
	l.ee_email_add as WorkEmail,
	case when l.primary_email = 'WORK' then 'W'
		 when l.primary_email = 'HOME' then 'H' end as PrimaryEmail,
	case when isnull(l.primary_email, 'WORK') = 'WORK' and len(l.ee_email_add) > 0 then l.ee_email_add
		 else isnull(l.new_home_email,'') end as PreferredEmail,
	l.housing_status as OrigHousingStatus,
	l.new_status as DestHousingStatus,
	t.account_exec as Ae,
	cs1.title as AeTitle,
	cs1.description as AeName,
	cs1.phone as AePhone,
	cs1.ext as AeExt,
	cs1.out_phone as AeAfterHour,
	cs1.email as AeEmail,
	cs1.fax as AeFax,
	t.assistant_account_exec as Aae,
	cs2.description as AaeName,
	isnull(p.web_travel_form, 'N') as WebTravelForm,
	cs1.sae_initials as Sae,
	cs3.description as SaeName,
	cs3.first_name as SaeFirstName,
	cs3.last_name as SaeLastName,
	cs3.title as SaeTitle,
	cs3.email as SaeEmail,
	cs4.email as EtAudEmail,
	@EtDoneLetterCount as EtDoneLetterCount,
	c.web_er as ExpenseReport,
	c.orig_receipts as OrigReceipt,
	c.orig_receipts_intl as OrigReceiptIntl,
	c.paid_thru_payroll as PaidThruPayroll,
	c.paid_thru_payroll_intl as PaidThruPayrollIntl,
	isnull(al.active, 0) as AnyTransferLoginFlag,
	case when (@Hash is not null and @EvalReturned = 0) then 1 else 0 end as DisplayEvalLink,
	@Hash as EvalLinkHash,
	@EmpId as EmployeeId
from syn_transfer_orbit t
	join syn_company c on c.cono = @cono
	left outer join co_logo lg on lg.cono = @cono and inactive_date is null
	left outer join syn_transfer_login l on t.tid = l.tid and l.trans_id = @NewestLoginId		
	left outer join syn_anytransferlogins al on t.tid = al.tid
	left outer join syn_co_policy p on p.company = @cono and t.policy_nbr = p.policy_nbr
	left outer join syn_counselor cs1 on t.account_exec = cs1.user_code					
	left outer join syn_counselor cs2 on t.assistant_account_exec = cs2.user_code
	left outer join syn_counselor cs3 on cs1.sae_initials = cs3.user_code
	left outer join syn_counselor cs4 on t.expense_aud = cs4.user_code
where t.tid = @tid


END
