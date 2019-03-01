



/* 
09/13/17 jtp Created
12/28/17 snc: Updated to use synonym
*/

CREATE view [dbo].[co_policy_bene]
As
Select 
	[ID]						as bene_id
    ,[cono]						as cono
    ,[benefit_category_name]	as bene_cat_name
    ,[company_title]			as co_title
    ,[company_description]		as co_desc
    ,[include]					as include
from syn_company_policy_descriptions





