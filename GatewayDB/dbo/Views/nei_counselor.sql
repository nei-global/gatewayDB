


/*
09/26/17 jtp: Created
*/


CREATE view [dbo].[nei_counselor]
As
Select c.user_code				as user_code
      ,c.[description]			as [desc]
      ,c_sae.[description]		as manager
      ,c_sae.email				as mgr_email
      ,c_sae.title				as mgr_title
      ,c.sae_initials			as mgr_init
      ,c.title					as title
      ,c.phone					as phone
      ,c.fax					as fax
      ,c.out_phone				as out_phone
      ,c.email					as email
      ,c_bckp.[description]		as bckp_name
      ,c_bckp.email				as bckp_email
      ,c_bckp.title				as bckp_title
      ,c.backup_initials		as bckp_init
      ,c.[role]					as [role]
      ,c.ext					as phone_ext
      ,c.contractor				as contr
      ,c.inactive				as inactive
      ,c.office_location		as office_loc
      ,c.off_site_state			as off_site_state
      ,c.time_zone				as time_zone
      ,c.second_email			as sec_email
      ,c.first_name				as first_name
      ,c.last_name				as last_name
      ,c.direct_phone			as direct_phone
      ,c.home_phone				as home_phone
      ,c.cell_phone				as cell_phone
      ,c.preferred_phone		as pref_phone
      ,c.hire_date				as hire_date
      ,c.birth_month			as birth_month
      ,c.birth_day				as birth_day
      ,c.bio_updated			as bio_updated
      ,c.bio_one				as bio_one
      ,c.bio_two				as bio_two
      ,c.bio_three				as bio_three
      ,c.bio_four				as bio_four
      ,c.bio_five				as bio_five
      ,c.forward_call			as fwd_call
      ,c.forward_email			as fwd_email
      ,c.dom_int				as dom_int
      ,c.demo_user				as demo_user
      ,c.nei_team				as nei_team
      ,c.years_in_relo			as years_in_relo
      ,c.years_in_real_estate	as years_in_real_estate
      ,c.years_in_notes			as years_in_notes
      ,c.years_in_cust_svc		as years_in_cust_svc
      ,c.years_outside_country	as years_outside_country
from syn_counselor c
	LEFT OUTER JOIN syn_counselor c_sae ON c.sae_initials = c_sae.user_code
	LEFT OUTER JOIN syn_counselor c_bckp ON c.backup_initials = c_bckp.user_code




