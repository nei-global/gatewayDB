
/*
* 01/02/18 snc: switched to synonym
*/


CREATE VIEW [dbo].[ee_er_multi_curr_summary]
AS
/*
12/5/17  jtp  created
*/
SELECT tid
,exprpt_nbr as er_id
,SUM(intl_amount) as intl_amt
,currency
FROM            syn_exp_rpt_multi_currency
GROUP BY tid, exprpt_nbr, currency




