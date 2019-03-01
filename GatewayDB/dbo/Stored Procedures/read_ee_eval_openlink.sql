
/*
2018-06-28    JET  TFS-6258
				Creating Read Crud for eval_openlink for the hash with the most recent [sent] in eval_svc

2018-07-02	 JET	TFS-6423
				Change to use syn_ee_Eval_Svc_Reports to because of a request to filter out "returned" evals...
				which was later recinded.

*/


CREATE PROCEDURE [dbo].[read_ee_eval_openlink] 
	@tid varchar(10)
AS

Begin


SELECT seeo.[tid]
      ,seeo.[eval_nbr]
      ,seeo.[hash]
FROM syn_ee_eval_openlink seeo
JOIN syn_ee_eval_sent_recd seesr ON seeo.[tid] = seesr.[tid] and seeo.[eval_nbr] = seesr.[eval_nbr] and returned is null
CROSS APPLY (SELECT MAX([eval_nbr]) as max_nbr FROM syn_ee_eval_openlink seeo2 WHERE  seeo2.[tid] = @tid GROUP BY seeo2.[tid] ) seeo2
CROSS APPLY (SELECT MAX(sent) as max_sent FROM [syn_ee_eval_sent_recd] seesr2 WHERE  seesr2.[tid] = @tid and seeo2.max_nbr = seesr2.[eval_nbr] GROUP BY seesr2.[tid] ) sees2
WHERE seeo.[tid] = @tid and seesr.sent = sees2.max_sent



End



