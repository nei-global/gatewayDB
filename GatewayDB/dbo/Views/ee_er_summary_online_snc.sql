

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[ee_er_summary_online_snc]
as
/*
08/30/17 snc: Created
09/11/17 snc: Modified, adding create_date
09/15/17 snc: Modified for multiple descriptions in same column
10/04/17 jtp: Added process_date column
*/
/*SELECT ee_er.tid
	  ,ee_er.er_id
	  ,isnull(ee_er_online.create_date,ee_er.recd_date) as create_date
      ,recd_date
      ,exp_group.description
	  ,status_detail_code
	  ,isnull(ee_er_multi_curr.intl_amt,amt_req) as req_amt
	  ,isnull(ee_er_multi_curr.currency,'USD') as req_currency
	  ,er_wksht_sum_amt as disb_amt-- need to grab from oi to sql and add to view
	  ,er_wksht_req_submit_limit as disb_curr-- need to grab from oi to sql and add to view

  FROM ee_er
	inner join exp_group
		on ee_er.category = exp_group.code
	left outer join ee_er_multi_curr
		on ee_er.tid = ee_er_multi_curr.tid
			and ee_er.er_id = ee_er_multi_curr.er_id
	Left outer join ee_er_online
		on ee_er.tid = ee_er_online.tid
			and ee_er.er_id = ee_er_online.er_id
--			and replace(ee_er.er_id,'W-','') = convert(varchar(10),ee_er_online.er_id_auto)
*/
SELECT ee_er.tid
		,ee_er.er_id
      ,recd_date
      ,isnull(ee_er_online.create_date,ee_er.recd_date) as create_date
	  ,dbo.get_ER_exprpt_date_sent(ee_er.tid, ee_er.er_id, ee_er.voucher_id, ee_er.req_for_funds_disb, ee_er.payroll_cycle) AS  process_date
	  ,isnull(exp_group.description,stuff((
		select ','+exp_group.description
		from ee_er er,exp_group
		where ee_er.category like concat('%',exp_group.code,',%') and 
			er.tid = ee_er.tid and er.er_id = ee_er.er_id
		for xml path('')),1,1,'')) as description
	  ,status_detail_code
	  ,isnull(ee_er_multi_curr.intl_amt,amt_req) as req_amt
	  ,isnull(ee_er_multi_curr.currency,'USD') as req_currency
	  ,er_wksht_sum_amt as disb_amt-- need to grab from oi to sql and add to view
	  ,er_wksht_req_submit_limit as disb_curr-- need to grab from oi to sql and add to view

  FROM ee_er
	left outer join exp_group
		on ee_er.category = exp_group.code
	left outer join ee_er_multi_curr
		on ee_er.tid = ee_er_multi_curr.tid
			and ee_er.er_id = ee_er_multi_curr.er_id
	Left outer join ee_er_online
		on ee_er.tid = ee_er_online.tid
			and ee_er.er_id = ee_er_online.er_id
Union all

SELECT DISTINCT 
 r.tid
 ,convert(varchar(10), r.er_id)
 ,r.create_date
 ,NULL as process_date
 ,r.submit_date as exprpt_date
 ,e.Benefit_Type AS description
 ,'S' as status_detail_code
 , e.amount as intl_amount
 ,e.Currency
 ,0.00 as er_wksht_Sum_Amt
 ,0.00 as er_wksht_Req_Submit_Limit


FROM ee_er_Online r 
INNER JOIN ee_er_item_Online e 
 ON r.er_id_auto = e.Er_id_auto
WHERE r.status = 1 
AND convert(varchar(10), r.er_id) NOT IN 
	(
	SELECT er_id
	FROM ee_er
	)
AND r.er_id_auto = e.er_id_auto



