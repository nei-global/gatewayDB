


/*
2018-06-26	JET TFS 6247 Correct Email usage
		If transfer_login.primary_email = ‘work’ or ‘WORK’ or NULL , 
			then use the transfer_login.ee_email_add field.  
		If transfer_login.primary_email = ‘home’ or ‘HOME’, 
			then use the transfer_login.new_home_email field.
		Also modified to use the renamed synonym.
08/08/2018 - JET TFS 7106 - Changed ee_email_add case statement.

*/

CREATE VIEW [dbo].[nei_login]
As
/*
SELECT  l.[user_name]
      ,l.[password]
      ,l.[attempt_no]
      ,l.[force_reset]
      ,l.[opt_in]
      ,l.[last_login]
      ,l.[2_factor_phone]
      ,l.[status]
      ,l.[user_type]
      ,l.[preferred_email]
      ,l.[reset_pin]
      ,l.[reset_pin_date]
      ,l.[reset_pin_phone]
      ,tl.[login_token]
      ,tl.[login_token_date]
  FROM [dbo].[login] l
  LEFT Join [syn_nei_transfer_login] tl on tl.[UserId] =  l.[user_name]

  union
*/
  Select 
       CAST(tl.[UserId] as VARCHAR(150))as [user_name]
       ,tl.[password]    
	   ,CAST(tl.[attempt_no] as int) as [attempt_no]      
	   ,tl.[force_reset]	   
       ,CAST(null as date)  as [opt_in]
       ,CAST(tl.[last_login] as datetime) as [last_login]
	   ,tl.[auth2FactorPhone] as [2_factor_phone]
	   ,CAST('ACT' as varchar(5)) as [status]
	   ,CAST('EE' as varchar(5)) as  [user_type]
	   ,case
			When tl.primary_email = 'WORK' and LEN(ISNULL(ee_email_add,'')) >0 THEN ee_email_add
			When tl.primary_email is NULL  and LEN(ISNULL(ee_email_add,'')) >0 THEN ee_email_add
			When tl.primary_email = 'HOME' and LEN(ISNULL(new_home_email,'')) >0 THEN	new_home_email
			ELSE ISNULL(new_home_email,'')
		END as [preferred_email]
	   ,CAST(NULL as INT) as [reset_pin] 
	   ,CAST(NULL as DATETIME) as [reset_pin_date] 
	   ,CAST(NULL as varchar(25)) as [reset_pin_phone] 
	   ,CAST(tl.[login_token] as varchar(75) ) as [login_token] 
	   ,CAST(tl.[login_token_date] as datetime) as [login_token_date] 
	from  [syn_transfer_login] tl








