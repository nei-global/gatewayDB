



CREATE view [dbo].[ee_er_online_bcm]
As

/* 
11/30/17 jtp Created
*/
Select [er_id]			as er_id_auto
      ,[expRpt_nbr]		as er_id
      ,[TID]			as tid
      ,[DateSubmitted]	as submit_date
      ,[Total_Exp]		as tot_exp
      ,[Total_ReimExp]	as tot_reim_exp
      ,[Status]			as [status]
      ,[Comments]		as comment
      ,[pymnt]			as payment
      ,[address1]		as address1
      ,[address2]		as address2
      ,[city]			as city
      ,[state]			as state
      ,[zip]			as zip
      ,[country]		as country
      ,[IsSubmitted]	as is_submitted	
      ,[iagree]			as iagree
      ,[createDate]		as create_date
      ,[lastupdated]	as last_updated
  FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[erOnline_Rpt]










