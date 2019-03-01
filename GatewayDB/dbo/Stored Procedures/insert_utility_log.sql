
-- =============================================
-- Author:		Paras Bhandari
-- Create date: 09/06/2017
-- Description:	Inserts the log message into dbo.utility_log table.
-- =============================================
CREATE PROCEDURE [dbo].[insert_utility_log]	
	 @application_name nvarchar(100)
	,@level_name nvarchar(50)
	,@url nvarchar(max)
	,@action nvarchar(500)
	,@message nvarchar(max)
	,@logger nvarchar(250)
	,@callsite nvarchar(max)
	,@exception nvarchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Validate required field.
	IF (@application_name IS NULL) BEGIN
		RAISERROR('Parameter @application_name is required', 16, 1);
	END;

	IF (@level_name IS NULL) BEGIN
		RAISERROR('Paramenter @level_name is required', 16, 1);
	END;

	IF (@message IS NULL) BEGIN
		RAISERROR('Paramenter @message is required', 16, 1);
	END;

	-- Get application id based on provided application name.
	DECLARE @application_id tinyint;
	SELECT @application_id = application_id 
	FROM dbo.utility_log_application WITH(NOLOCK) 
	WHERE name = @application_name;

	-- Assign default application id if provided name is not valid. We don't want to raise error in system because of unknown application name.
	IF (@application_id IS NULL) BEGIN
		SELECT @application_id = application_id
		FROM dbo.utility_log_application WITH(NOLOCK)
		WHERE name = 'Unknown';
	END;

	-- Get level id based on provided level name.
	DECLARE @level_id tinyint;
	SELECT @level_id = level_id
	FROM dbo.utility_log_level WITH(NOLOCK)
	WHERE name = @level_name;

	-- Assign default level id if provided level name is not valid.
	IF (@level_id IS NULL) BEGIN
		SELECT @level_id = level_id
		FROM dbo.utility_log_level WITH(NOLOCK)
		WHERE name = 'Unknown';
	END;

	BEGIN TRY
		BEGIN TRAN
		INSERT INTO dbo.utility_log(application_id, level_id, url, action, message, logger, callsite, exception)
		VALUES(@application_id, @level_id, @url, @action, @message, @logger, @callsite, @exception);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0) BEGIN
			ROLLBACK TRAN
		END;
	END CATCH;	
END;

