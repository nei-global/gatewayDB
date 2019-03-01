

/*
* 02/08/18 snc: Created
*/

CREATE VIEW [dbo].[ee_web_form]
AS
SELECT tid
	,CONVERT(varchar(3), row_number() OVER (PARTITION BY tid
		ORDER BY tid ASC)) AS position
	,REPLACE(syn_co_policy_web_form.web_form_access, '*', '') AS web_form_id

FROM syn_TRANSFER_ORBIT 
	LEFT OUTER JOIN syn_co_policy_web_form 
		ON syn_transfer_orbit.ccode = syn_co_policy_web_form.company 
		AND syn_transfer_orbit.policy_nbr = syn_co_policy_web_form.policy_nbr

