




CREATE VIEW [dbo].[ee_er_multi_curr]
AS
/*
* 08/30/17 snc created
* 01/02/18 snc: switched to synonym
*/
SELECT tid
,exprpt_nbr as er_id
,position as position
,intl_amount as intl_amt
,currency
FROM syn_exp_rpt_multi_currency





