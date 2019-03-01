
-- =============================================
-- Author:		Paras Bhandari
-- Create date: 06/19/2017
-- Description:	Returns expense report data only for provided tid.
-- =============================================
CREATE PROCEDURE [dbo].[get_expense_report] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid IS NULL) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	SELECT * FROM dbo.ee_er WHERE tid = @tid;
	--SELECT tid, er_id, recd_date, category, amt_req, status_detail_code FROM dbo.ee_er WHERE tid = @tid;
END

