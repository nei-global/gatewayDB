




-- =============================================
-- Author:		Sushil Joshi
-- Create date: 07/31/2017
-- Description:	Returns transferee benefit information only for provided tid.
--				Note: By: Paras Bhandari | On: 09/20/2017 | User Story 1034 - Modified the view name as standard changed.		
-- 09/6/2018 JET TFS 7065 Instead of using company_policy_descriptions, should use syn_nei_benefit.web_desc		
-- =============================================
CREATE PROCEDURE [dbo].[get_transferee_benefit_info] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	 SELECT DISTINCT TPB.tid, TPB.alt_benefit_name, snb.web_desc AS company_description
	 FROM dbo.ee_policy_benefit AS TPB WITH (nolock)
		 JOIN dbo.syn_nei_benefit AS snb ON TPB.description = snb.benefit_categories
		 JOIN dbo.ee_profile ON TPB.tid = dbo.ee_profile.tid
	 WHERE TPB.tid =@tid  AND snb.web_er  = '1'

END







