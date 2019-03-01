


-- =============================================
-- Author:		mla
-- Create date: 1/10/2019
-- Description:	Get webtravelform value by tid, BUG 9586:  emergency fix since the Web API can't send policy_nbr that contains '/'
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_web_travel_form_info] 
	@tid varchar(10)
AS
BEGIN

	declare @cono varchar(10) = dbo.get_CONO(@tid)

	select @cono as cono,
		p.web_travel_form
	from ee_profile t
		join co_policy p on t.policy_nbr = p.policy_nbr and p.cono = @cono
	where tid = @tid

END

