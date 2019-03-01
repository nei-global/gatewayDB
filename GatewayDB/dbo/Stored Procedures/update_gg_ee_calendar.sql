

-- =============================================
-- Author:		Sushil Joshi>
-- Create date: <01/29/2018>
-- Description:	<Update given task in calendar table>
-- 10/19/18 mkb: updated formatting to standards, removed transcation, and @returncode
-- =============================================

CREATE PROCEDURE [dbo].[update_gg_ee_calendar] 
	@taskid int,
	@title varchar(100),
	@description varchar(max) = null,
	@start_date datetime,
	@end_date datetime,
	@isalldayevent bit = null

	
AS
BEGIN

IF (@taskid is null OR @title is null OR @start_date is null OR @end_date is null)
	BEGIN
		RAISERROR('Require Parameter is null', 16, 1);
	 END;
	 

UPDATE [dbo].[gg_ee_calendar] 
	SET		
		title = @title,
		description = @description,
		start_date = @start_date,
		end_date = @end_date,
		isallday_event = @isalldayevent
	WHERE taskid = @taskid

END

