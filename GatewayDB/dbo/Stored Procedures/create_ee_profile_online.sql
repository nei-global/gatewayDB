
-- 2018-06-22  JET tfs 5927 convert ee_profile_online to a view of nei_website data

CREATE PROCEDURE [dbo].[create_ee_profile_online]
	   @tid varchar(10) null,
       @orig_addr varchar(200) null,
       @orig_city varchar(75) null,
       @orig_state varchar(5) null,
       @orig_zip varchar(15) null,
       @orig_country varchar(5) null,
       @orig_home_phone varchar(25) null,
       @orig_housing_status varchar(50) null,
       @dest_addr varchar(200) null,
       @dest_city varchar(75) null,
       @dest_state varchar(5) null,
       @dest_zip varchar(15) null,
       @dest_country varchar(5) null,
       @dest_home_phone varchar(25) null,
       @dest_work_phone varchar(25) null,
       @dest_work_ext int null,
       @dest_home_email varchar(150) null,
       @dest_work_email varchar(150) null,
       @dest_housing_status varchar(50) null,
       @temp_addr varchar(200) null,
       @temp_city varchar(75) null,
       @temp_state varchar(5) null,
       @temp_zip varchar(15) null,
       @temp_country varchar(5) null,
       @primary_email char(1) null,
       @move_type varchar(50) null,
       @status varchar(5) null,
       @status_date datetime null,
       @updated_by varchar(150) null
	 
AS
BEGIN


INSERT INTO [syn_transfer_login](
	   [tid]
	  ,[userid]
	  ,[ccode]
      ,[OLD_address]
      ,[OLD_city]
      ,[OLD_state]
      ,[OLD_zip]
      ,[OLD_country]
      ,[home_phone]
      ,[housing_status]
	  ,[new_address]
      ,[new_city]
      ,[new_state]
      ,[new_zip]
      ,[new_country]
      ,[new_home_phone]
      ,[new_phone]
      ,[new_office_ext]
      ,[new_home_email]
      ,[ee_email_add]
      ,[new_status]
	  ,[primary_email] 
	  )
VALUES
 	  (@tid,
	   @tid,
	   LEFT(@tid,charindex('-',@tid)-1),
       @orig_addr,
       @orig_city,
       @orig_state,
       @orig_zip,
       @orig_country,
       @orig_home_phone,
       @orig_housing_status,
       @dest_addr,
       @dest_city,
       @dest_state,
       @dest_zip,
       @dest_country,
       @dest_home_phone,
       @dest_work_phone,
       @dest_work_ext,
       @dest_home_email,
       @dest_work_email,
       @dest_housing_status,
	   CASE	
			When @primary_email = 'W' THEN 'WORK'
			When @primary_email is NULL  THEN @primary_email
			When @primary_email = 'H' THEN	'HOME'
	   END )
 /*
 INSERT INTO syn_Transfer_Orbit(  
	   [tid]
      ,[temp_address]
      ,[temp_city]
      ,[temp_state]
      ,[temp_zip]
      ,[temp_country]
      ,[move_type])
    VALUES (
	   @tid,
       @temp_addr,
       @temp_city,
       @temp_state,
       @temp_zip,
       @temp_country,
       @move_type);
*/
END










