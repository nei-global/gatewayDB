


CREATE PROCEDURE [dbo].[update_et_done_letter_sent]
		@tid varchar(10),
		@oth_et_done_sent datetime,
		@oth_et_done_how_sent varchar(10) = NULL,
		@move_complete bit = NULL,
		@pending_comments varchar(4000) = NULL,
		@move_complete_date datetime = NULL,
		@items_pending_date datetime = NULL
	 
AS
BEGIN

	UPDATE syn_et_done_letter_sent
	SET	oth_et_done_how_sent = ISNULL(@oth_et_done_how_sent,oth_et_done_how_sent)
      ,move_complete = ISNULL(@move_complete,move_complete)
      ,pending_comments = ISNULL(@pending_comments,pending_comments)
      ,move_complete_date = ISNULL(@move_complete_date,move_complete_date)
      ,items_pending_date = ISNULL(@items_pending_date,items_pending_date)
	WHERE (tid = @tid) and (oth_et_done_sent = @oth_et_done_sent)

END	




