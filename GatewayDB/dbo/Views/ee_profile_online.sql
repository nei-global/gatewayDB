

-- 2018-06-22  JET tfs 5927 convert ee_profile_online to a view of nei_website data and use renamed synonym


CREATE VIEW [dbo].[ee_profile_online]
AS



SELECT  tid
,ccode
,CAST(old_address as [varchar](200)) as orig_addr
,CAST(old_city as [varchar](75)) as orig_city
,CAST(old_state as [varchar](5)) as orig_state
,CAST(old_zip as [varchar](15)) as orig_zip
,CAST(old_country as [varchar](5)) as orig_country
,CAST(home_phone as [varchar](25)) as orig_home_phone
,cast([housing_status] as [varchar](50)) as orig_housing_status
,CAST([cell_phone] as [varchar](25)) as cell_phone 
,CAST(new_address as [varchar](200)) as dest_addr
,CAST(new_city as [varchar](75)) as dest_city
,CAST(new_state as [varchar](5)) as [dest_state]
,CAST(new_zip as [varchar](15)) as dest_zip
,CAST(new_country as [varchar](5)) as dest_country
,CAST(new_phone as [varchar](25)) as dest_work_phone
,CAST(new_office_ext as int) as dest_work_ext
,CAST(new_home_phone as [varchar](25)) as dest_home_phone
,cast(new_status as varchar(50)) as dest_housing_status
,CAST(cell_phone as [varchar](25)) as dest_cell_phone
,CAST(new_home_email as [varchar](150)) as dest_home_email
,CAST(ee_email_add as [varchar](150)) as dest_work_email
,CAST(null as [varchar](200)) as temp_addr
,CAST(null as [varchar](75)) as [temp_city]
,CAST(null  as [varchar](5)) as [temp_state]
,CAST(null as [varchar](15)) as [temp_zip]
,CAST(null as [varchar](5)) as [temp_country] 
,CAST(null as [varchar](25)) as [temp_phone] 
,CAST(null as [varchar](50)) as [move_type]
,CAST(null as [varchar](5)) as [status]
,CAST(null as datetime) as [status_date]
,CAST(null as [varchar](150)) as [updated_by]
,CAST(null as datetime) as [updated_date]
,CAST(null as  [varchar](1)) as [primary_email]
FROM [syn_transfer_login]






