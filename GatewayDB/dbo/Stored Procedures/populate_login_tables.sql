


-- =============================================
-- Author:		Joe Powers
-- Create date: Oct. 3rd, 2017
-- Description:	Populate the login tables
-- =============================================

CREATE PROCEDURE [dbo].[populate_login_tables] 
	-- Add the parameters for the stored procedure here
	@years_back int = 2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	PRINT ' The start of login tables data load'
	PRINT ' '
	PRINT ' Remove data from ee_login table'
	-- Remove all rows from ee_login
	DELETE FROM [dbo].[ee_login];

	PRINT ' Remove data from login_password_history table'
	-- Remove all rows from login_password_history
	DELETE FROM [dbo].[login_password_history];

	PRINT ' Remove data from ee_profile_online'
	-- Remove all rows from ee_profile_online
	DELETE FROM [dbo].[ee_profile_online];

	PRINT ' Remove data from login table'
	-- Remove all rows from login
	DELETE FROM [dbo].[login];

	PRINT ' '
	PRINT ' Start data load on ee_profile_online'

	INSERT INTO [dbo].[ee_profile_online]
		([tid],[orig_addr],[orig_city],[orig_state],[orig_zip],[orig_country],[orig_home_phone],[orig_housing_status]
		,[dest_addr],[dest_city],[dest_state],[dest_zip],[dest_country],[dest_home_phone],[dest_work_phone],[dest_work_ext]
		,[dest_home_email],[dest_work_email],[dest_housing_status]
		,[temp_addr],[temp_city],[temp_state],[temp_zip],[temp_country]
		,[primary_email],[move_type],[status],[status_date],[updated_by],[updated_date])
	SELECT 
		o.[TID]
		,ISNULL(tl.[old_address], oh.[old_address]) as [orig_addr]
		,ISNULL(tl.[old_city], oh.[old_city]) as [orig_city]
		,ISNULL(tl.[old_state], oh.[old_state]) as [orig_state]
		,ISNULL(tl.[old_zip], oh.[old_zip]) as [orig_zip]
		,ISNULL(tl.[old_country], oh.[old_country]) as [orig_country]
		,ISNULL(tl.[home_phone], oh.[home_phone]) as [orig_home_phone]
		,oh.[prior_status_desc] as [orig_housing_status]
		,ISNULL(tl.[new_address], nh.[new_address]) as [dest_addr]
		,ISNULL(tl.[new_city], nh.[new_city]) as [dest_city]
		,CAST(ISNULL(tl.[new_state],nh.[new_state]) as varchar(5)) as [dest_state]
		,ISNULL(tl.[new_zip], nh.[new_zip]) as [dest_zip]
		,CAST(ISNULL(tl.[new_country], nh.[new_country])as varchar(5)) as [dest_country]
		,ISNULL(tl.[new_home_phone], nh.[new_home_phone]) as [dest_home_phone]
		,ISNULL(tl.[new_phone], nh.[new_phone]) as [dest_work_phone]
		,ISNULL(tl.[new_office_ext], nh.[new_office_ext]) as [dest_work_ext]
		,ISNULL(tl.[new_home_email], nh.[new_home_email]) as [dest_home_email]
		,ISNULL(tl.[ee_email_add], nh.[ee_email_add]) as [dest_work_email]
		,tl.[housing_status] as [dest_housing_status]
		,NULL as [temp_addr]
		,NULL as [temp_city]
		,NULL as [temp_state]
		,NULL as [temp_zip]
		,NULL as [temp_country]
		,UPPER(LEFT(tl.[primary_email] ,1)) as [primary_email]
		,o.move_type
		,NULL as [status]
		,NULL as status_date
		,NULL as updated_by
		,NULL as updated_date
	FROM [ag_listener_test].[ORBIT_DATA].[dbo].[TRANSFER_ORBIT] o
		JOIN [ag_listener_test].[ORBIT_DATA].[dbo].[TRANSFER_OLD_HOME] oh ON oh.tid = o.tid
		JOIN [ag_listener_test].[ORBIT_DATA].[dbo].[TRANSFER_NEW_HOME] nh ON nh.tid = o.tid
		LEFT JOIN 
			(SELECT * FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_login] t
			WHERE t.last_login = (SELECT x.last_login
								FROM
								(select tid, max(last_login) as last_login
								FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_login]
								group by tid) x
								where x.tid = t.tid)) tl
			ON tl.TID = o.tid
		LEFT JOIN [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_policy_dates] tpd ON tl.TID = tpd.tid
	WHERE (tpd.bps_orig_end_date > Cast(DateAdd(yy, -2, GetDate()) as Date) OR tpd.bps_orig_end_date IS NULL)

	PRINT ' Finished data load on ee_profile_online'

	PRINT ' '

	PRINT ' Start data load on login'

	INSERT INTO [dbo].[login]
		([user_name],[password],[attempt_no],[force_reset],[opt_in],[last_login],[2_factor_phone],[status],[user_type]
      ,[preferred_email],[reset_pin],[reset_pin_date],[reset_pin_phone])
	SELECT 
		o.[TID]
		,tl.[password]
		,tl.[attempt_no]
		,tl.[force_reset]
		,CAST(IIF(tl.[optIn] = 1, tl.[last_login], NULL) as Date) as optIn
		,CAST(tl.[last_login] as Datetime) as last_login
		,tl.[auth2FactorPhone]
		,IIF(tpd.bps_orig_end_date > Cast(DateAdd(yy, -2, GetDate()) as Date) OR tpd.bps_orig_end_date IS NULL,'ACT','INACT') as [status]
		,'EE' as [user_type]
		,IIF(tl.primary_email = 'WORK', tl.ee_email_add, IIF(tl.primary_email = 'HOME', tl.new_home_email, NULL))		as [preferred_email]
		,NULL as [reset_pin]
		,NULL as [reset_pin_date]
		,NULL as [reset_pin_phone]
	FROM [ag_listener_test].[ORBIT_DATA].[dbo].[TRANSFER_ORBIT] o
		 JOIN 
			(SELECT * FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_login] t
			WHERE t.last_login = (SELECT x.last_login
								FROM
								(select tid, max(last_login) as last_login
								FROM [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_login]
								group by tid) x
								where x.tid = t.tid)) tl
			ON tl.TID = o.tid
		LEFT JOIN [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_policy_dates] tpd ON tl.TID = tpd.tid
	WHERE (tpd.bps_orig_end_date > Cast(DateAdd(yy, -@years_back, GetDate()) as Date) OR tpd.bps_orig_end_date IS NULL)
		AND tl.[password] IS NOT NULL

	PRINT ' Finished data load on login'
	PRINT ' '

	PRINT ' Start data load on ee_login'

	INSERT INTO [dbo].[ee_login]
		([user_name],[tid],[user_nbr])
	SELECT l.user_name
		, p.tid
		, 1 as user_nbr
	FROM [dbo].[login] l
		JOIN [dbo].[ee_profile_online] p ON p.[tid] = l.[user_name]

	PRINT ' Finished data load on ee_login'
	
	PRINT ' '

	PRINT ' Start data load on login_password_history'

	INSERT INTO [dbo].[login_password_history]
		([user_name],[password],[pwd_set_date],[inactive])
	SELECT l.[user_name]
		,p.[password]
		,p.[password_set_date]
		,p.[expired]
	FROM [dbo].[login] l
		JOIN [ag_listener_test].[NEI_WEBSITE].[dbo].[transfer_login_pwdLog] p ON p.[userid] = l.[user_name]
	PRINT ' Finished data load on ee_login'

END


