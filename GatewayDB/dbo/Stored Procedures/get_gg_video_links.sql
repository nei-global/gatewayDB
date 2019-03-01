
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 7/25/2018
-- Description:	Returns list of global gateway video links.

-- 07/26/18 snc: Revised to use synonym
-- =============================================

CREATE  PROCEDURE [dbo].[get_gg_video_links] 
AS
BEGIN

SELECT
code,
url_location
FROM dbo.[syn_gg_video_links]
END
