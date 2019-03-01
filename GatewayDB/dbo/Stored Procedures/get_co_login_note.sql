
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 9/28/2018
-- Description:	US7446-Returns login note message for given cono, and within currentdate.
-- =============================================

CREATE  PROCEDURE [dbo].[get_co_login_note] 
  @cono int,
  @current_date datetime,
  @nei_site varchar(1)
AS
BEGIN
SELECT 
co_login_note_id,
cono,
nei_site,
title,
note_desc,
note_start_date,
note_end_date,
inactive
FROM [dbo].[syn_co_login_note]
where cono=@cono 
AND inactive<>1
AND nei_site=@nei_site
AND note_start_date<=@current_date
AND ((note_end_date is null) OR (note_end_date>=@current_date))
END


