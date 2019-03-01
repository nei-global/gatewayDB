




CREATE VIEW [dbo].[ee_profile]
AS
/*
09/11/17 snc: Created
09/21/17 jtp: Added policy_nbr & policy_desc
10/03/17 jtp: Added move_type
10/19/17 jtp: Added NULLed columns web_city, web_state and web_country
01/02/18 snc: updated to use synonyms
03/02/18 jtp: removed hard coding of web_city, state & country and put actual columns
06/14/18 JET: added nei_phone_nbr
10/24/18 mbk: changed t.exp_admin_audit to t.expense_aud
11/13/18 mkb: added emp_id
*/

SELECT   t.tid						AS tid
		,t.first_name				AS first_name
		,t.last_name				AS last_name
		,t.account_exec				AS ae
		,t.assistant_account_exec	AS aae
		,t.exp_admin				AS et_admin
		--,t.exp_admin_audit			AS et_aud
		,t.expense_aud				AS et_aud
		,t.policy_nbr				AS policy_nbr
		,p.policy_name				AS policy_desc
		,t.move_type				AS move_type
		,t.web_city					AS web_city
		,t.web_state				AS web_state
		,t.web_country				AS web_country
		,t.nei_phone_nbr
		,j.emp_id
FROM syn_transfer_orbit t
	LEFT JOIN syn_co_policy p 
		ON t.ccode = p.company 
			AND t.policy_nbr = p.policy_nbr
	LEFT OUTER JOIN syn_JOB_RELATED j
		ON t.tid = j.tid
		
