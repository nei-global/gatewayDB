-- =============================================
-- Author:		John Tatum
-- Create date: 05/09/2018
-- Description:	Added as part of User Story 5087- task 5199. Returns transfer Logins for provided trans_id.
-- 
-- 5/16/2018 - JET removed Status filter
-- 06/21/2018 - jet add [tid] t the select
-- =============================================
CREATE PROCEDURE [dbo].[read_anyTransferLogins]
	-- Add the parameters for the stored procedure here
	@trans_id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [trans_id]
		,[active]
		,[datestamp]
		,tid
	FROM [syn_anytransferlogins] WITH(NOLOCK)
	WHERE trans_id =  @trans_id
	ORDER BY datestamp

END


