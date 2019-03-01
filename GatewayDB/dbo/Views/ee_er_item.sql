


CREATE VIEW [dbo].[ee_er_item]
AS
/*
09/01/17 snc Created
12/28/17 snc: Updated to use synonym
*/

SELECT        
tid
,exprpt_no as er_id
--,item_nbr as item_id
,receipt_no as item_id
,amt_submitted as submit_amt
,currency_submitted as submit_curr
,exp_code
,description
,amt_submitted + amt_denied AS approve_amt
,amt_denied as denied_amt
,amount
,currency
,exchange_rate as exch_rate
,status
,except_nbr as except_id
,receipt_date
,source
,notes
,tax_svc
,home_host
,subcategory
,grid_amount as grid_amt
,measurement
,benefit_category
,amt_for_cap
,period
,who_used
FROM syn_er_wksht



