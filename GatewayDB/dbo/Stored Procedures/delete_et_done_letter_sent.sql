
-- =============================================
-- 02/01/2018  jtp  created
-- =============================================

CREATE PROC [dbo].[delete_et_done_letter_sent]
		@tid varchar(10),
		@oth_et_done_sent datetime
AS 
BEGIN 
 
    DELETE    
	FROM   syn_et_done_letter_sent
    WHERE  (tid = @tid) and (oth_et_done_sent = @oth_et_done_sent)

END







