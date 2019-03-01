

CREATE view [dbo].[ee_er]
As

/* 
08/30/17 snc Created
12/08/17 jtp added er_wksht_sum_amount and er_wkshts_curr_request_limit
02/08/19 mla US 9736 - added exprpt_date_sent to the output 
*/
Select tid
,exprpt_nbr as er_id
,exprpt_date as recd_date
,exprpt_amt_req as amt_req
,exprpt_source as source
,exprpt_audit_by as aud_by
,exprpt_audit_date as aud_date
,exprpt_info_recd as info_recd_date
,exprpt_txn as [transaction]
,exprpt_cat as category
,exprpt_review as review_date
,exprpt_review_aud as review_aud
,exprpt_check_date as check_date
,exprpt_voucher as posted_voucher_id
,payroll_state
,payroll_cycle
,federal_wages as federal_wage
,state_wages as state_wage
,local_wages as local_wage
,local_codes as local_code
,fica_wages as fica_wage
,medicare_wages as med_wage
,exprpt_status as status
,exprpt_except_date as except_req_date
,exprpt_except_recd as except_recd_date
,exprpt_turn_reason as turn_reason
,state_rate
,wages_received as wage_recd
,status_detail_code
,er_voucher as voucher_id
,rqst_for_funds_disb as req_for_funds_disb
,hhg_nbr as hhg_id
,er_wksht_sum_amount as er_wksht_sum_amt -- need to grab from oi to sql and add to view
,er_wkshts_curr_request_limit as er_wksht_req_submit_limit -- need to grab from oi to sql and add to view
,exprpt_date_sent as exprpt_date_sent 

from syn_expense_reports





