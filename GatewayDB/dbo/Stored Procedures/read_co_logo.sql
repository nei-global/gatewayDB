


-- =============================================
-- Author:		Paras Bhandari
-- Create date: 10/11/2017
-- Description:	Get logo image information based on company number(cono).
-- Modified:	2/1/2019 mla: while working bug 9755, I renamed this to match the parameter name for clarity.
-- =============================================
CREATE PROCEDURE [dbo].[read_co_logo]	
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

	SELECT * FROM dbo.co_logo WITH(NOLOCK) WHERE cono = @cono;
END;

