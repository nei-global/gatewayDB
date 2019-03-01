
/*
 04/13/18 snc: created

 2018-07-02   JET TFS-6423
				Change to use  syn_ee_eval_openlink
				
						
*/
CREATE PROCEDURE [dbo].[get_ee_eval_link_bool] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS

Begin
	DECLARE @reccount as int 
	SET @reccount = (SELECT CASE WHEN RECCOUNT > 0 THEN 1 ELSE 0 END FROM(
		SELECT count(E.tid)AS RECCOUNT
		FROM	syn_ee_eval_openlink E 
			INNER JOIN syn_ee_eval_sent_recd Ef ON E.Tid = Ef.Tid AND E.Eval_nbr = Ef.Eval_nbr
			CROSS APPLY (SELECT MAX([eval_nbr]) as max_nbr FROM syn_ee_eval_openlink seeo2 WHERE  seeo2.[tid] = @tid GROUP BY seeo2.[tid] ) seeo2
			CROSS APPLY (SELECT MAX(sent) as max_sent FROM syn_ee_eval_sent_recd seesr2 WHERE  seesr2.[tid] = @tid and seeo2.max_nbr = seesr2.[eval_nbr] GROUP BY seesr2.[tid] ) sees2
		WHERE E.Tid = @tid
			AND	Ef.Sent =  sees2.max_sent
			AND	Ef.Returned IS NULL) A)
		--RETURN @reccount 
		select @reccount as Id

End



