



CREATE view [dbo].[nei_benefit]
As

/* 
11/8/2017 jtp Created
*/

Select benefit_categories			as benefit,
		inactive					as inactive,
		exp_group					as exp_grp,
		[description]				as [descption],
		ISNULL(no_dollar_benefit,0)	as no_dollar_bene,
		ordinal						as ordinal,
		ISNULL(web_er,0)			as web_er,	
		web_desc					as web_desc
From syn_nei_benefit




