





CREATE VIEW [dbo].[ee_dest_contact]
AS
/*
09/11/17 snc: Created
12/28/17 snc: Updated to use synonym
*/

SELECT       tid
,new_address as address
,new_city as city
,new_state as [state]
,new_zip as zip
,new_country as country
,new_phone as work_phone
,new_home_phone as home_phone
,new_cell as cell_phone
,new_home_email as home_email
,ee_email_add as work_email
FROM  syn_transfer_new_home 






