-- =============================================
-- Author:		Dilshad Shaik
-- Create date: 10/30/2018
-- Description:	Get webtravelform value
-- =============================================
CREATE PROCEDURE [dbo].[get_cono_web_travel_form_info] 
	@cono varchar(3),
	@policy_nbr varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cono,web_travel_form from co_policy where cono=@cono and policy_nbr=@policy_nbr
END

