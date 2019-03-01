
-- =============================================
-- Author:		Sushil Joshi>
-- Create date: <01/29/2018>
-- Description:	<Retrieve calendar task for given tid>
-- =============================================

CREATE PROCEDURE [dbo].[read_gg_ee_calendar] 
	@tid varchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	select 
	tid,
	taskId,
	title,
	description,
	start_date,
	end_date,
	isallday_event 
	from dbo.gg_ee_calendar
	where tid=@tid
END
