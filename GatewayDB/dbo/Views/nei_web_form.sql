



/*
* 02/08/18 snc: created
*/

CREATE VIEW [dbo].[nei_web_form]
AS
SELECT company as cono
	,code
	,company + code AS web_form_id
	,cast(revised as date) as rev_date
	,tag
	,type 
	,rank 
	,description 
	,cast(syn_company.master as int) AS cono_master 
	,cast(obsolete as date) as co_inactive_date
    ,recd_date as recd_date_loc
	--,v_id
	,needs_returned as upload
	,syn_nei_web_form.inactive as ee_inactive
	,sub_type

FROM  syn_nei_web_form
	LEFT OUTER JOIN syn_company 
		ON syn_nei_web_form.company = syn_company.cono



