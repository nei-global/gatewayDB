







/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[ee_er_summary_online_OLD]
as
/*
08/30/17 snc: Created
09/11/17 snc: Modified, adding create_date
09/15/17 snc: Modified for multiple descriptions in same column
10/04/17 jtp: Added process_date column
12/05/17 jtp: Modified the WHERE clause on the second part of the view to use the key index
12/05/17 jtp: Change ee_er_multi_curr to ee_er_multi_curr_summary.
12/19/17 snc: change ee_er_item_online to ee_er_item_online_summary for amount and currency
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
	  ,ee_er.category
	  ,isnull(exp_group.description,stuff((
		select ','+g.description
		from exp_group g
		where g.code IN (select er.category from ee_er_cat er
						where er.tid = ee_er.tid and er.er_id = ee_er.er_id)
		for xml path('')),1,1,'')) as description
	  ,status_detail_code
	  ,isnull(mc.intl_amt,amt_req) as req_amt
	  ,isnull(mc.currency,'USD') as req_currency
	  ,CAST(isnull(er_wksht_sum_amt, 0.00) as money) as disb_amt-- need to grab from oi to sql and add to view
	  ,er_wksht_req_submit_limit as disb_curr-- need to grab from oi to sql and add to view
	  ,exp_group.web_er_excl

  FROM ee_er
	left outer join exp_group
		on ee_er.category = exp_group.code
	left outer join ee_er_multi_curr_summary mc
		on ee_er.tid = mc.tid
			and ee_er.er_id = mc.er_id
	Left outer join ee_er_online
		on ee_er.tid = ee_er_online.tid
			and ee_er.er_id = ee_er_online.er_id

Union all

SELECT DISTINCT 
 r.tid
 ,convert(varchar(10), r.er_id) as er_id
 ,r.create_date
 ,NULL as process_date
 ,r.submit_date as exprpt_date
 ,NULL as category
 ,e.Benefit_Type AS description
 ,'S' as status_detail_code
 , es.sum_amt as intl_amount	--need to sum
 ,es.currency				--need to sum
 ,0.00 as er_wksht_Sum_Amt
 ,NULL as er_wksht_Req_Submit_Limit
 ,0 as web_er_excl

FROM ee_er_Online r 
INNER JOIN ee_er_item_Online e 
 ON r.er_id_auto = e.Er_id_auto
left outer join ee_er_item_online_summary es
 on r.er_id = es.er_id
WHERE r.status = 1 
AND (
	SELECT TOP 1 er_id
	FROM ee_er
	WHERE  tid = r.tid AND er_id =  r.er_id
	) IS NULL
AND r.er_id_auto = e.er_id_auto









