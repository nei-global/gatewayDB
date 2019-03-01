
-- =============================================
-- Author:	Sushil Joshi
-- Create date: 01/30/2018
-- Description:	transferee profile information based on provided tid.
-- NOTE to SQL Team: Please update this with synonym table if it requires. I am incorporating the same column name in
--		dotNET code as in view dbo.ee_profile. 
--
-- 06/25/2018 JET tfs 6278 removed hard coded JANE DOE
-- =============================================

create PROCEDURE [dbo].[read_ee_profile] 
	@tid varchar(10)
AS
BEGIN
	SELECT 
	tid,
	[first_name],
	[last_name],
	ae,
	aae,
	policy_nbr,
	policy_desc,
	move_type,
	web_city,
	web_state,
	web_country
    FROM dbo.ee_profile 
	WHERE tid = @tid;
END





