
-- =============================================
-- Author:		Paras Bhandari
-- Create date: 03/07/2018
-- Description:	Added as part of User Story 2708. Returns email id of AE and AAE for provided tid.
--				Updated stored procedure to optimize and return aae_email from cc.email rather than cc.backup_email | User Story 4690 | Paras Bhandari
-- 08/03/2018  JET - tfs-7021 Changed the joins to left join and added a where clause to make sure atleast one of the emails exists
-- =============================================
CREATE PROCEDURE [dbo].[get_account_executive_email] 
	-- Add the parameters for the stored procedure here
	@tid VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		eep.tid,
		cc.email as ae_email, 
		cc2.email as aae_email 
	FROM dbo.ee_profile eep WITH(NOLOCK) 
		LEFT JOIN dbo.counselor cc WITH(NOLOCK) ON cc.user_code = eep.ae 
		LEFT JOIN dbo.counselor cc2 WITH(NOLOCK) ON cc2.user_code = eep.aae
	WHERE eep.tid = @tid
	and (cc.email is not null or cc2.email is not null);

END
