






CREATE VIEW [dbo].[ee_profile_test]
AS
/*
09/11/17 snc: Created
09/21/17 jtp: Added policy_nbr & policy_desc
10/03/17 jtp: Added move_type
10/19/17 jtp: Added NULLed columns web_city, web_state and web_country
01/02/18 snc: updated to use synonyms
03/02/18 jtp: removed hard coding of web_city, state & country and put actual columns
*/

SELECT   t.tid						as tid
		,t.first_name				as first_name
		,t.last_name				as last_name
		,t.account_exec				as ae
		,t.assistant_account_exec	as aae
		,t.exp_admin				as et_admin
		,t.exp_admin_audit			as et_aud
		,t.policy_nbr				as policy_nbr
		,p.policy_name				as policy_desc
		,t.move_type				as move_type
		,t.web_city					as web_city
		,t.web_state				as web_state
		,t.web_country				as web_country
		,dbo.get_nei_phone_nbr(Left(t.tid,(CHARINDEX('-',t.tid,0)-1)), account_exec) AS nei_phone_nbr
FROM syn_transfer_orbit t
	LEFT JOIN syn_co_policy p ON t.ccode = p.company 
			AND t.policy_nbr = p.policy_nbr







