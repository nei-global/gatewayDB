

/*
2018-06-22  JET tfs 5927 convert ee_profile_online to a view of nei_website data

2018-06-26  JET TFS 5927 Changed to use renamed synonym
2018-07-10 JET tfs 6566 Corrected populating primary_email
08/02/18   JET TFS-7028 modified [primary_email] with case statement
08/10/2018 JET TFS-7156 removed "Coalece" to set values equal to old value if null is passed.
*/
CREATE PROCEDURE [dbo].[update_ee_profile_online]
	   @tid varchar(10),
       @orig_addr varchar(200) = NULL,
       @orig_city varchar(75) = NULL,
       @orig_state varchar(5) = NULL,
       @orig_zip varchar(10) = NULL,
       @orig_country varchar(5) = NULL,
       @orig_home_phone varchar(25) = NULL,
       @orig_housing_status varchar(50) = NULL,
       @dest_addr varchar(200) = NULL,
       @dest_city varchar(75) = NULL,
       @dest_state varchar(5) = NULL,
       @dest_zip varchar(10) = NULL,
       @dest_country varchar(5) = NULL,
       @dest_home_phone varchar(25) = NULL,
       @dest_work_phone varchar(25) = NULL,
       @dest_work_ext int = NULL,
       @dest_home_email varchar(150) = NULL,
       @dest_work_email varchar(150) = NULL,
       @dest_housing_status varchar(50) = NULL,
       @temp_addr varchar(200) = NULL,
       @temp_city varchar(75) = NULL,
       @temp_state varchar(5) = NULL,
       @temp_zip varchar(10) = NULL,
       @temp_country varchar(5) = NULL,
       @primary_email char(1) = NULL,
       @move_type varchar(50) = NULL,
       @status varchar(5) = NULL,
       @status_date datetime = NULL,
       @updated_by varchar(150) = NULL,
	   @cell_phone  varchar(25) = NULL
	 
AS
BEGIN


UPDATE [syn_transfer_login]
SET    [OLD_address] =		@orig_addr
      ,[OLD_city] =			@orig_city
      ,[OLD_state] =		@orig_state
      ,[OLD_zip] =			@orig_zip
      ,[OLD_country] =		@orig_country
      ,[home_phone] =		@orig_home_phone
      ,[housing_status] =	@orig_housing_status
	  ,[new_address] =		@dest_addr
      ,[new_city] =			@dest_city
      ,[new_state] =		@dest_state
      ,[new_zip] =			@dest_zip
      ,[new_country] =		@dest_country
      ,[new_home_phone] =	@dest_home_phone
      ,[new_phone] =		@dest_work_phone
      ,[new_office_ext] =	@dest_work_ext
      ,[new_home_email] =	@dest_home_email
      ,[ee_email_add] =		@dest_work_email
      ,[new_status] =		@dest_housing_status
	  ,[cell_phone] =		@cell_phone
	  ,[primary_email] =	CASE 
								When @primary_email = 'W' THEN 'WORK'
								When @primary_email is NULL THEN @primary_email
								When @primary_email = 'H' THEN	'HOME'
							END
WHERE   [tid] = @tid
 /*
UPDATE syn_Transfer_Orbit
SET	   [temp_address] = @temp_addr
      ,[temp_city] = @temp_city
      ,[temp_state] = @temp_state
      ,[temp_zip] = @temp_zip
      ,[temp_country] = @temp_country
      ,[move_type] = @move_type
WHERE   [tid] = @tid
*/
END












