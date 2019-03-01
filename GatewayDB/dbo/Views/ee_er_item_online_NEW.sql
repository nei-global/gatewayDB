





CREATE view [dbo].[ee_er_item_online_NEW]
As

/* 
12/21/17 jtp Created
*/

Select [item_id]		as item_id
      ,[Er_id]			as er_id_auto
      ,[Benefit_Type]	as benefit_type
      ,[Category]		as category
      ,[From_dt]		as from_date
      ,[To_dt]			as to_date
      ,[Description]	as [description]
      ,[Amount]			as amount
      ,[Currency]		as currency
      ,[isSubmitted]	as [status]
      ,[create_date]	as create_date
      ,[last_updated]	as last_updated
  FROM syn_ee_er_item_online






