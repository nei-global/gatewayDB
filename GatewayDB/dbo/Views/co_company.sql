


/* 
09/12/17 jtp Created
12/28/17 snc: Updated to syn_company
11/01/18 mkb: added sql_pref_date_code and pref_date_format
*/

CREATE view [dbo].[co_company]
AS
SELECT 
	cono						as cono
	,cname						as name
	,phone						as main_phone					
	,tollfree_phone				as toll_free_phone
	,web_add					as web_addr
	,ccity						as city
	,cst						as state
	,czip						as zip
	,country					as country		
	,expense_manager			as exp_mgr
	,marketing					as marketing
	,ma_sent					as ma_sent_date
	,counselor					as team
	,master						as master_cono
	,senior_account_exec		as sae
	,mp_ae						as mp_ae		
	,web_er						as web_er
	,mile_rate					as mile_rate
	,gup_rate					as gup_rate
	,CAST(inception_date AS date)	as inception_date
	,CAST(sign_date AS date)		as sign_date
	,create_date				as create_date
	,client_rel_mgr				as crm
	,inactive					as inactive
	,account_exec_csv			as ae_csv
	,assistant_account_exec_csv	as aae_csv
	,expense_auditor_csv		as exp_aud_csv
	,exp_admin_csv				as exp_admin_csv
	,account_manager			as acct_mgr
	,intl_director				as intl_director
	,hhg_escrow					as hhg_escrow
	,why_no_escrow				as why_no_escrow
	,payback_required			as payback_req
	,payback_collected_by		as payback_collected_by
	,cost_est_gup_rate			as cost_est_gup_rate
	,web_expense_section		as web_exp_sec
	,rpt_frequency				as rpt_freq
	,rpt_due					as rpt_due						
	,rpt_type_web				as rpt_type_web	
	,rpt_service_level_agreement	as rpt_sla
	,rpt_difficulty_level		as rpt_diff_level
	,rpt_coordinator			as rpt_coord
	,rpt_date_based_on			as rpt_date_based_on
	,CAST(rpt_date_from AS date)	as rpt_from_date			
	,CAST(rpt_date_to AS date)	as rpt_to_date 
	,rpt_notes					as rpt_note
	,q1							as rpt_q1
	,q2							as rpt_q2
	,q3							as rpt_q3
	,q4							as rpt_q4
	,mkt_lead					as mkt_lead
	,mkt_sic_code				as mkt_sic_code
	,mkt_sic_desc				as mkt_sic_desc
	,mkt_outsource_type			as mkt_outs_type
	,per_diem					as per_diem
	,orig_receipts				as orig_rcpt
	,div_tax_year				as div_tax_year
	,intl_client_rel_mgr		as intl_crm
	,mkt_parent_co				as mkt_par_co
	,mkt_ind_type				as mkt_ind_type
	,mkt_why_chg_nei			as mkt_why_chg_nei
	,mkt_intl					as mkt_intl
	,er_wksht_note  			as er_wksht_note
	,cw_excladv					as cw_excl_adv
	,cw_totalstwh				as cw_tot_st_wh
	,cw_deductible				as cw_dedct
	,cw_txblstgup				as cw_txbl_st_gup
	,cw_grossup					as cw_gross_up	
	,cw_txblgupttl				as cw_txbl_gup_tot
	,cw_withholdings			as cw_wh
	,cw_excldedctadv			as cw_excl_dedct_adv
	,cw_netcheckto				as cw_net_chk_to
	,days_pw_reset				as days_pw_reset
	,pmt_before_nh_start_date	as pmt_before_nh_start_date
	,orig_receipts_intl			as orig_rcpt_intl
	,paid_thru_payroll			as paid_thru_pay
	,auth_upload				as auth_upload
	,print_draft				as prt_draft
	,website_upload				as web_upload
	,comp_close_date			as comp_close_date
	,client_urgency				as co_urgency
	,projected_cost				as proj_cost
	,move_tool					as move_tool
	,client_2factor				as co_2factor
	,transferee_2factor			as ee_2factor
	,web						as web
	,estimate_to_actual			as est_to_actl
	,web_rpts					as web_rpts
	,co_ee_portal_new			as ee_portal_new
	,pref_date_format
	,sql_pref_date_code
FROM syn_company



