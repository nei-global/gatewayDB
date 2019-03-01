
CREATE VIEW [dbo].[ee_orig_contact]
AS
/*
* 09/11/17 snc: Created
* 01/02/18 snc: switched to synonym
*/
SELECT  TRANSFER_OLD_HOME.tid
,old_address as [address]
,old_city as city
,old_state as [state]
,old_zip as zip
,old_country as country
,transfer_orbit.office_phone as work_phone
,home_phone
,transfer_orbit.old_cell as cell_phone 
,old_home_email as home_email
,old_work_email as work_email
FROM syn_TRANSFER_OLD_HOME as TRANSFER_OLD_HOME
  LEFT OUTER JOIN  syn_TRANSFER_OLD_HOME_2 as TRANSFER_OLD_HOME_2
	ON TRANSFER_OLD_HOME.tid = TRANSFER_OLD_HOME_2.tid
  Left Outer Join syn_Transfer_Orbit as TRANSFER_Orbit
	on TRANSFER_OLD_HOME.tid = Transfer_Orbit.tid
	
