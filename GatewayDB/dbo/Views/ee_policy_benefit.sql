







CREATE view [dbo].[ee_policy_benefit]
As
/*
* 09/11/17 snc: Created
* 01/02/18 snc: Updated to use synonym
*/

Select [tid]
,[position]
,[bps_alt_benefit_list] as alt_benefit_name
,[bps_exclusions] as exclusions
,[benefit_cap] as est_amt
,convert(date,[bps_benefit_beg_date]) as beg_date
,convert(date,[bps_benefit_end_date]) as end_date
,[bps_benefit_status] as status
--,[bps_exceptions] as exception
,[policy_description] as description
,convert(date,[ls_req_date]) as lump_sum_req_date
,[benefit_cap_amt] as cap_amt
,[declined]
,[benefit_exception] as exception
from syn_transfer_policy_benefits







