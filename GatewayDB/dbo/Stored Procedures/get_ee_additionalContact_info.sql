
-- Author:		Sushil Joshi
-- Create date: 5/03/2018
-- Description:	Returns additional contact info for provided tid from counselor view.
--						
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_additionalContact_info] 
	@tid varchar(10)
AS

BEGIN
	SELECT 
		cc1.user_code as UserCode,
		cc1.first_name as FirstName,
		cc1.last_name as LastName,
		cc1.title as Title,
		cc1.email as Email,
		cc1.phone as Phone
	FROM dbo.ee_profile ee
		INNER JOIN dbo.counselor cc ON ee.ae = cc.user_code
		INNER JOIN dbo.counselor cc1 ON cc1.user_code = cc.sae_initials
	WHERE tid = @tid;
END