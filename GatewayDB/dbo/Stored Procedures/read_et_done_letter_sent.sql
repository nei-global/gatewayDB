


-- =============================================
-- 02/01/2018  jtp  created
-- 02/28/2018  snc: Updated where clause, no need for oth_et_done_sent in read.
-- =============================================
CREATE PROCEDURE [dbo].[read_et_done_letter_sent] 
		@tid varchar(10)
		--@oth_et_done_sent datetime
AS
BEGIN
	SELECT 
		tid,
		oth_et_done_sent,
		oth_et_done_how_sent,
		move_complete,
		pending_comments,
		move_complete_date,
		items_pending_date
	FROM syn_et_done_letter_sent 
	--WHERE (tid = @tid) and (oth_et_done_sent = @oth_et_done_sent)
	WHERE (tid = @tid)
END



