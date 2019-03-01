


CREATE VIEW [dbo].[ee_sp_contact]
AS
/*
09/11/17 snc: modified tid to varchar(10), default no to varchar(5)
10/05/17 jtp: removed all svc_status of 'D','N','X'
10/05/17 jtp: restricted HHG to hhg_current_status_code IN ('M', 'I', 'C', 'P', 'SI', 'SP')
10/09/17 jtp: added departure services to settling in services query. Uses type column.
01/02/18 snc: updated to use synonyms
07/03/18 snc: fixed bug on dsp
07/17/18 snc: removed Mortgage Assistance per HLK, corrected type on listing, added career assistance, appraisal ignores DS and PM
07/19/18 snc: changing to EE contacts
*/
/*
select * from [ee_sp_contact]
where tid IN ('102-1302','446-2407','192-1344')
order by tid, svc_type, svc_nbr
*/
select allcontacts.tid
		,allcontacts.svc_type
		,allcontacts.svc_type_desc
		,allcontacts.svc_nbr
		,allcontacts.sp_id
		,allcontacts.svc_status
		,allcontacts.sp_name
		,allcontacts.sp_contact_name
		,allcontacts.sp_contact_phone
		,allcontacts.sp_contact_email
from (
--
-- appraisal service
--
select	a.tid				as tid
		,'APPR'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.abno				as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.app_status		as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
			
from syn_appraisal a 
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'APPR'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
--and a.location_nbr			= c.location_nbr
and a.actual_ab_location_nbr = c.location_nbr
and a.actual_ab_nbr			 = c.position   
where app_status not in ('DS','PM') and a.[type] = 'APPR'
--
-- Career/Family Assistance
--
union all
select	a.tid				as tid
		,'CA'				as svc_type
		,vt.[description]	as svc_type_desc
		,'1'				as svc_nbr
		,a.cap_vendor_nbr	as sp_id
		,a.cap_status		as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
		
from syn_Homefinding a 
--
inner join syn_vendor_company b
on a.cap_vendor_nbr			= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'CA'
--
left join syn_vendor_location_contact c
on a.cap_vendor_nbr			= c.vendor_nbr
and a.cap_location_nbr		= c.location_nbr
and a.cap_contact_nbr		= c.position

--
-- cultural service
--
union all
select	a.tid				as tid
		,'CUL'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.cul_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.[status]			as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
			
from syn_cultural a 
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'CUL'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position
--
-- destination service
--
union all
select	a.tid				as tid
		,'DSP'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.ds_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,NULL				as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
			
from syn_dest_service a 
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'DSP'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position
--
-- home finding brokers
--
union all
select	a.tid				as tid
		,'BRK'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.position			as svc_nbr
		,a.hf_vendor_nbr	as sp_id
		,a.hf_brk_status	as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
			
from syn_Homefind_Brokers a 
--
inner join syn_vendor_company b
on a.hf_vendor_nbr			= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'BRK'
--
left join syn_vendor_location_contact c
on a.hf_vendor_nbr			= c.vendor_nbr
and a.hf_agent_location_nbr		= c.location_nbr
and a.hf_agent_contact_nbr		= c.position

--
-- HHG_MOVE_ALL
--
union all
select	a.tid						as tid
		,'HHG'						as svc_type
		,vt.[description]			as svc_type_desc
		,a.hhg_no					as svc_nbr
		,a.vendor_nbr				as sp_id
		,a.hhg_current_status_code	as svc_status
		,b.company_name				as sp_name
		,c.contact_name				as sp_contact_name
		,c.contact_phone			as sp_contact_phone
		,c.contact_email			as sp_contact_email
			
from syn_HHG_MOVE_ALL a 
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'HHG'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee			= c.location_nbr
and a.contact_nbr_ee			= c.position
where a.hhg_current_status_code IN ('M', 'I', 'C', 'P', 'SI', 'SP')
--
-- Language
--
union all
select	a.tid				as tid
		,'LANG'				as svc_type
		,vt.[description]			as svc_type_desc
		,a.lang_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.[status]			as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
			
from syn_Language a 
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
inner join syn_ventype vt on vt.code = 'LANG'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position
--
-- listing  
--
union all 
select	a.tid				as tid
		,'TS'				as svc_type
		,'Listing Agent'	as svc_type_desc
		,a.list_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.list_type		as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
from syn_Listing a
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr	
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.agent_location_nbr	= c.location_nbr
and a.agent_nbr				= c.position
where a.list_type IN ('EEX', 'EL', 'EPC', 'ER', 'ERR', 'EX', 'RO')
--
/* -- Removed per HLK
-- mortgage assistance  
--
union all 
select	a.tid				as tid
		,'MTGD'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.ma_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.ref_status		as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
from syn_MTG_ASST a
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr	
--
inner join syn_ventype vt on vt.code = 'MTGD'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr			= c.location_nbr
and 1						= c.position
and 'I'						!= c.contact_status 
--
*/
-- Orient HF  
--
union all 
select	a.tid				as tid
		,'AOT'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.aot_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.[status]			as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
from syn_Area_OrientHF a
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr	
--
inner join syn_ventype vt on vt.code = 'AOT'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position
--
-- rental assistance
-- 
union all 
select	a.tid					as tid
		,'RA'					as svc_type
		,'Rental Assistance'	as svc_type_desc
		,a.rf_no				as svc_nbr
		,a.vendor_nbr			as sp_id
		,a.ref_status			as svc_status
		,b.company_name			as sp_name
		,c.contact_name			as sp_contact_name
		,c.contact_phone		as sp_contact_phone
		,c.contact_email		as sp_contact_email

from syn_Rent_Asst a	
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr			= c.location_nbr
and a.contact_nbr			= c.position
--
-- settling in service(SIS) and departure service(DEP)
-- 
union all 
select	a.tid				as tid
		,a.[type]			as svc_type
		,IIF(a.[type]='SIS','Settling In','Departure Services') as svc_type_desc
		,a.sis_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.[status]			as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email

from syn_SettlingInService a	
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position
--
-- temporary living
--
union all 
select	a.tid				as tid
		,'TL'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.tl_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.[status]			as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
from syn_Temp_Living a
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr	
--
inner join syn_ventype vt on vt.code = 'TL'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position
--
-- visa immigration
--
union all 
select	a.tid				as tid
		,'IMM'				as svc_type
		,vt.[description]	as svc_type_desc
		,a.visa_no			as svc_nbr
		,a.vendor_nbr		as sp_id
		,a.[status]			as svc_status
		,b.company_name		as sp_name
		,c.contact_name		as sp_contact_name
		,c.contact_phone	as sp_contact_phone
		,c.contact_email	as sp_contact_email
from syn_VISA_Immigration a
--
inner join syn_vendor_company b
on a.vendor_nbr				= b.vendor_nbr	
--
inner join syn_ventype vt on vt.code = 'IMM'
--
left join syn_vendor_location_contact c
on a.vendor_nbr				= c.vendor_nbr
and a.location_nbr_ee		= c.location_nbr
and a.contact_nbr_ee		= c.position

) allcontacts
where
(allcontacts.svc_status NOT IN ('D','N','X')
or (svc_type = 'DSP' and svc_status is null))
and not(allcontacts.sp_name is null)









