

-- =============================================
-- Author:	Paras Bhandari
-- Create date: 01/15/2018
-- Description:	transferee profile information based on provided tid.
-- NOTE to SQL Team: Please update this with synonym table if it requires. I am incorporating the same column name in
--		dotNET code as in table dbo.ee_profile_online. 
--
-- 2018-06-22  JET tfs 5927 convert ee_profile_online to a view of nei_website data
-- 2018-06-26 JET TFS 5927 - Changed read to use synonym instead of the view for consistency.
-- =============================================
CREATE PROCEDURE [dbo].[read_ee_profile_online] 
	@tid varchar(10)
AS
BEGIN
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
	,CASE
		WHEN primary_email = 'WORK' THEN 'W' 
		WHEN primary_email = 'HOME' THEN 'H'
	END as [primary_email]
	FROM [syn_transfer_login]
	WHERE tid = @tid
END





