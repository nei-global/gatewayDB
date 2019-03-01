CREATE PROCEDURE [dbo].[delete_gg_ee_calendar] 
	@taskId int
	
AS
BEGIN
	declare @returnCode int 
	set @returnCode=0;
	
	SET NOCOUNT ON;
	IF (@taskId is null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	Begin Try
	Begin Transaction
	Delete from dbo.gg_ee_calendar
	where taskid=@taskId
    Commit Transaction
	End Try

	Begin catch
		 set @returnCode=1;--error
		 Rollback Transaction
	 End Catch
	select @returnCode
END