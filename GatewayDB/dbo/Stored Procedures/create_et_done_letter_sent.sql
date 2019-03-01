
-- =============================================
-- 02/01/2018  jtp  created
-- =============================================

CREATE PROCEDURE [dbo].[create_et_done_letter_sent]
		@tid varchar(10),
		@oth_et_done_sent datetime,
		@oth_et_done_how_sent varchar(10) = NULL,
		@move_complete bit = NULL,
		@pending_comments varchar(4000) = NULL,
		@move_complete_date datetime = NULL,
		@items_pending_date datetime = NULL
	 
AS

BEGIN
	
	INSERT INTO syn_et_done_letter_sent(
			tid,
			oth_et_done_sent,
			oth_et_done_how_sent,
			move_complete,
			pending_comments,
			move_complete_date,
			items_pending_date
		)
		VALUES (
			@tid,
			@oth_et_done_sent,
			@oth_et_done_how_sent,
			@move_complete,
			@pending_comments,
			@move_complete_date,
			@items_pending_date
		)


END	



