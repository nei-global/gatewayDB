



-- =============================================
-- Author:		Dutch Dasanaike
-- Create date: June 2017
-- Description:	<Description,,>
-- 08/02/18   JET TFS-7023  modified [primary_email] with case statement
-- 08/08/2018 - JET TFS 7106 - Changed ee_email_add case statement.
-- =============================================

CREATE PROCEDURE [dbo].[get_transferee_Info] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	SELECT
	 a.tid,
	 a.first_name, 
	 a.last_name,
	 c.work_phone as office_phone, -- a.office_phone,
	 c.cell_phone as old_cell,       -- a.old_cell,
	 c.address as old_address,
	 c.city as old_city,
	 c.state as old_state,
	 c.zip as old_zip,
	 c.country as old_country,
	 c.home_phone,
	 c.home_email as old_home_email,
	 c.work_email as old_work_email,
	 b.address as new_address,
	 b.city as new_city,
	 b.state  as new_state,
	 b.zip  as new_zip,
	 b.country as new_country,
	 b.work_phone as new_phone,
	 b.home_phone as new_home_phone,
	 b.cell_phone as  new_cell,
	 b.home_email as  new_home_email,
	   case
			When tl.primary_email = 'WORK' and LEN(ISNULL(ee_email_add,'')) >0 THEN ee_email_add
			When tl.primary_email is NULL  and LEN(ISNULL(ee_email_add,'')) >0 THEN ee_email_add
			When tl.primary_email = 'HOME' and LEN(ISNULL(new_home_email,'')) >0 THEN	new_home_email
			ELSE new_home_email
		END as ee_email_add,
	 a.policy_desc 
	FROM    ee_profile a
			INNER JOIN ee_dest_contact b
            ON a.tid = @tid AND b.tid = @tid
							INNER JOIN ee_orig_contact c
							ON c.tid = @tid
			Join syn_transfer_login tl on a.tid = tl.tid
END



