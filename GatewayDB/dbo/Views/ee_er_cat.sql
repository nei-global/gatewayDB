



CREATE view [dbo].[ee_er_cat]
As

/* 
11/8/2017 jtp Created
12/28/17 snc: updated to use synonym
*/

Select  
	c.tid					as tid,
	c.exprpt_nbr			as er_id,
	c.position				as position,
	c.exprpt_cat_mv			as category,
	g.[description]			as cat_desc
From syn_expense_report_cat c
	LEFT JOIN syn_exp_group g ON c.exprpt_cat_mv = g.code



