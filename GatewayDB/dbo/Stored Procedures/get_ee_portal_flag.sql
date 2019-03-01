
-- =============================================
-- Author:		Paras Bhandari
-- Create date: 06/01/2018
-- Description:	User Story 2678. Created. Selects flag to detemine if emulation goes to .net site or cold fusion site.
--				01/15/2019  | Paras Bhandari |  User Story 9136 | Modified to select move_tool. This flag is added to logic whether we need to send
--					emulation to Cold Fusion site or not.
--				02/20/2019 | Paras Bhandari | User Story 9929 | Modified @cono variable to int from varchar(3). So, we get the right cono regardless of the length before "-" of TID.
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_portal_flag] 
	-- Add the parameters for the stored procedure here
	@tid VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @cono int; 
	SET @cono = dbo.get_CONO(@tid);

	SELECT @tid as tid, cc.ee_portal_new, cp.move_tool 
	FROM dbo.ee_profile ep WITH(NOLOCK)
		JOIN dbo.co_company cc WITH(NOLOCK) ON cc.cono = @cono
		LEFT JOIN dbo.co_policy cp WITH(NOLOCK) ON cp.cono = @cono AND ep.policy_nbr = cp.policy_nbr
	WHERE ep.tid = @tid;
END
