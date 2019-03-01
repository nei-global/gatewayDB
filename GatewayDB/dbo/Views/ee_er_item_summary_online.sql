







/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[ee_er_item_summary_online]
as
/*
11/14/17  JTP  Created
02/09/18  JTP  Changes to use synonyms
*/
SELECT  tid		as tid
      ,er_id				as er_id
      ,item_id				as item_id
      ,receipt_date			as receipt_date
      ,exp_code				as exp_code
	  ,benefit_category		as benefit_cat
	  ,null					as from_date
	  ,null					as to_date
      ,[description]		as [description]
      ,submit_amt			as req_amt
      ,submit_curr			as req_curr
 	  ,denied_amt			as adj_amt
      ,amount				as disb_amt
      ,currency				as disb_curr
  FROM [dbo].[ee_er_item]

 
 Union ALL 

 SELECT  e.tid						as tid
	  ,e.expRpt_nbr					as er_id
	  ,i.item_id					as item_id
	  ,null							as receipt_date
	  ,null							as exp_code
      ,i.benefit_type				as benefit_cat
      ,i.from_dt					as from_date
      ,i.to_dt						as to_date
      ,i.[description]				as [description]
      ,i.amount						as req_amt
      ,i.currency					as req_curr
	  ,null							as adj_amt
	  ,null							as disp_amt
	  ,null							as disp_curr
  FROM [dbo].[syn_ee_er_Online] e 
	INNER JOIN [dbo].[syn_ee_er_item_Online] i
		ON e.er_id = i.er_id
  WHERE  e.expRpt_nbr not in (select er_id from ee_er)

union all
Select	[tid]
		,[exprpt_nbr]
	  ,null							as item_id
	  ,null							as receipt_date
	  ,null							as exp_code
      ,null							as benefit_cat
      ,null							as from_date	
      ,null							as to_date
      ,e.[exprpt_denied_desc]		as [description]
      ,null							as req_amt
      ,null							as req_curr
	  ,null							as adj_amt
	  ,null							as disp_amt
	  ,null							as disp_curr
	   FROM [dbo].[syn_Exp_Rpt_Denied] e 




