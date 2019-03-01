





CREATE VIEW [dbo].[ee_er_denied]
AS
/*
08/30/17 snc created
12/28/17 snc: Updated to look at synonym
*/
SELECT tid
,exprpt_nbr as er_id
,position
,exprpt_denied_cat as category
,exprpt_denied_amt as amount
,exprpt_denied_desc as [description]
,exprpt_denied_reason as reason
,exprpt_denied_currency as currency
FROM syn_Exp_Rpt_Denied






