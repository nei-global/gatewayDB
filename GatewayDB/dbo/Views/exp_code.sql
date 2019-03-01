



CREATE view [dbo].[exp_code]
As

/* 
11/11/17 jtp Created
12/08/17 jtp Added web_er_excl
*/

SELECT [expense_code]
      ,[description]
      ,[expense_group]
      ,[grossup]
      ,[taxability]
      ,[grossed_up]
      ,[category]
	  ,0				as web_er_excl
FROM syn_exp_codes




