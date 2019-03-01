
-- =============================================
-- Author:		Paras Bhandari
-- Create date: 09/18/2017
-- Description:	Determines if we need to show ACH or CHECK payment option for transferee in expense report save/submit.
-- =============================================
CREATE PROCEDURE [dbo].[get_transferee_ach_check_display_option]	
	 @cono int -- company number. first three digit of transferee id XXX-XXXX
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Validate required field.
	IF (@cono IS NULL) BEGIN
		RAISERROR('Parameter @cono is required', 16, 1);
	END;

	--SELECT cono, paid_thru_pay FROM dbo.co_company WITH(NOLOCK) WHERE cono = @cono;
	IF EXISTS(SELECT * FROM dbo.co_company WITH(NOLOCK) WHERE cono = @cono AND paid_thru_pay = 'Y') BEGIN
		SELECT @cono AS cono, convert(bit,0) AS 'is_display'
	END
	ELSE BEGIN
		SELECT @cono AS cono, convert(bit,1) AS 'is_display'
	END;
END;

