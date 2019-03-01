

-- =============================================
-- Author:		Sushil Joshi
-- Create date: 09/05/2018
-- Description:	Added as part of User Story 5741. Returns rtr documents for provided tid.
-- Modified:	1/3/19 mla:  Bug 9467, we also need to exclude type = 'ESC'
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_rtr_doc] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT tid, year, type, sent_datetime
	FROM  dbo.ee_et_rtr_log
	WHERE tid =@tid
		and type <> 'EC' 
		and type <> 'ESC'
END
