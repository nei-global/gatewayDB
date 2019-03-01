





CREATE view [dbo].[ee_er_summary_online]
as
/*
08/30/17 snc: Created
09/11/17 snc: Modified, adding create_date
09/15/17 snc: Modified for multiple descriptions in same column
10/04/17 jtp: Added process_date column
12/05/17 jtp: Modified the WHERE clause on the second part of the view to use the key index
12/05/17 jtp: Change ee_er_multi_curr to ee_er_multi_curr_summary.
12/19/17 snc: change ee_er_item_online to ee_er_item_online_summary for amount and currency
02/09/18 jtp: changes to uses synonyms and get the correct total amount of the ER.
06/26/18 snc: Change to include issubmitted check
06/28/18 snc: Change to look at ER isSubmitted instead of er item isSubmitted
09/21/2018 JET: TFS 7350 update the expense report summary for non-reimbursable status so that we exclude anything with a Source <> ER
10/11/2018 JET: TFS 7598 use string concantination of benefit_type with consideration for '>','&'.  Also moved the check the "unconsumed"
						 er items are not already in the top select, from the "where" to a join.
						 *** mkb changed to group by e3.er_id, benefit_type
10/15/18 mkb: removed dbo.get_ER_exprpt_date_sent function, replaced with select; pulled tid_exp_cap_list out as cte
02/08/19 mla: US 9736 removed ee_er_process_dates from the join, the exprpt_date_sent is now being calculated in orbit_data
*/

---unsubmitted expenses
WITH tid_exp_cat_list AS
 (SELECT ee_er.tid
		,ee_er.er_id
        ,REPLACE(ISNULL(exp_group.description,STUFF((
		SELECT ','+g.description
		FROM exp_group g
		WHERE g.code IN (SELECT er.category 
							FROM ee_er_cat er
							WHERE er.tid = ee_er.tid AND er.er_id = ee_er.er_id)
		FOR XML PATH('')),1,1,'')),'&amp;','&') AS description
	FROM ee_er
	LEFT OUTER JOIN exp_group
		ON ee_er.category = exp_group.code)

SELECT   ee_er.tid
		,ee_er.er_id
        ,recd_date
        ,ISNULL(eeo.create_date,ee_er.recd_date) AS create_date
	    --,dbo.get_ER_exprpt_date_sent(ee_er.tid, ee_er.er_id, ee_er.voucher_id, ee_er.req_for_funds_disb, ee_er.payroll_cycle) AS  process_date
	    --,pd.process_date
		,ee_er.exprpt_date_sent as process_date
	    ,ee_er.category
	   -- ,isnull(exp_group.description,stuff((
		  --select ','+g.description
		  --from exp_group g
		  --where g.code IN (select er.category from ee_er_cat er
		  --				where er.tid = ee_er.tid and er.er_id = ee_er.er_id)
		  --for xml path('')),1,1,'')) as description
		,ecl.description
	    ,status_detail_code
	    ,isnull(mc.intl_amt,amt_req) as req_amt
	    ,isnull(mc.currency,'USD') as req_currency
	    ,CAST(isnull(er_wksht_sum_amt, 0.00) as money) as disb_amt-- need to grab from oi to sql and add to view
	    ,er_wksht_req_submit_limit as disb_curr-- need to grab from oi to sql and add to view
	    ,exp_group.web_er_excl
  FROM ee_er
	LEFT OUTER JOIN exp_group
		ON ee_er.category = exp_group.code
	LEFT OUTER JOIN tid_exp_cat_list ecl 
		ON ee_er.tid = ecl.tid
		AND ee_er.er_id = ecl.er_id
	--LEFT OUTER JOIN ee_er_process_dates pd
	--	ON ee_er.tid = pd.tid
	--	AND ee_er.er_id = pd.er_id
	LEFT OUTER JOIN ee_er_multi_curr_summary mc
		ON ee_er.tid = mc.tid
		AND ee_er.er_id = mc.er_id
	LEFT OUTER JOIN ee_er_online_NEW eeo
		ON ee_er.tid = eeo.tid 
		AND ee_er.er_id = eeo.er_id
	WHERE (( ISNULL(status_detail_code,'') ='D' 
				AND 'ER' IN (Select value from STRING_SPLIT(source, ',')) ) 
				OR (ISNULL(status_detail_code,'') <>'D'))  

UNION all

---submitted expenses
SELECT DISTINCT
		r.tid
		,expRpt_nbr AS er_id
		,r.DateSubmitted AS recd_date
		,r.createdate AS create_date
		,NULL AS process_date
		,NULL AS category
		--changed to group by e3.er_id, benefit_type to make each description for each er_id entry. Website will not show duplicates of the desc for same er_id.
		,REPLACE(REPLACE(STUFF((SELECT DISTINCT ', '+ benefit_type 
									FROM syn_ee_er_item_online e3 
									WHERE e3.er_id = r.er_id
									GROUP BY e3.er_id,Benefit_Type
										--AND e3.currency = e.currency
									FOR XML PATH('')),1,2,''),'&gt;','>'),'&amp;','&') as description
		--remove if issubmitted = 0, hard code status to blank
		,Null AS status_detail_code 
		--,'S' as status_detail_code
		,e.tot_amt AS req_amt						--need to sum
		,e.currency AS req_currency				--need to sum
		,0.00 AS disb_amt
		,NULL AS disb_curr
		,0 AS web_er_excl
	FROM syn_ee_er_online r 
	LEFT OUTER JOIN (SELECT er_id, SUM(amount) AS tot_amt, currency 
						FROM syn_ee_er_item_online
						GROUP BY er_id, currency) e
		ON r.er_id = e.er_id
	WHERE  r.isSubmitted = 1
		--10/11/2018 JET: TFS 7598
		and NOT EXISTS (Select 1 
			from ee_er
			Where ee_er.tid = r.tid 
			AND ee_er.er_id = r.expRpt_nbr)
			
