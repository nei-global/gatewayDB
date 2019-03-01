

-- =============================================
-- Author:		Sushil Joshi
-- Create date: 12/13/2017
-- Description:	Returns submitted expense report items data for provided reportId.
-- 09/20/2018 JET 7350/7351 - add non-reimbursable expense items were the ee_er is denied in full.
--							  add a filter for non-reimbursable status to show only source = 'ER' .
-- 10/15/18 mkb: updated to meet standards, removed isnull from second data set
-- =============================================
CREATE PROCEDURE [dbo].[get_submittedExpense_reportItems] 
	-- Add the parameters for the stored procedure here
	@reportid varchar(100),
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@reportid IS NULL) BEGIN
		--RAISERROR('Parameter @tid is required', 16, 1);
		RAISERROR('Parameter @reportid is required', 16, 1);
	END;

SELECT 
		ets.tid,
		ets.er_id,
		ets.item_id,
		es.create_date,
		ets.benefit_cat,
		ets.description,
		ets.disb_curr,
		ets.disb_amt,
		ets.req_amt,
		ets.req_curr 
	FROM dbo.ee_er_summary_online es
		JOIN dbo.ee_er_item_summary_online ets
			 ON es.er_id = ets.er_id 
				AND es.tId = ets.tid 
				AND es.req_currency = ets.req_curr
	WHERE ets.er_id = @reportid AND es.tid = @tid
		  AND ISNULL(es.status_detail_code,'') <>'D'

UNION

SELECT 
		es.tid,
		es.er_id,
		position AS item_id,
		NULL AS create_date,
		exprpt_denied_cat AS benefit_cat,
		[exprpt_denied_desc] AS description,
		exprpt_denied_currency AS disb_curr,
		0 AS disb_amt,
		0 AS req_amt,
		exprpt_denied_currency AS req_curr 
FROM ee_er es
	JOIN [syn_Exp_Rpt_Denied] e 
		ON es.tid = e.tid 
			AND es.er_id = e.[exprpt_nbr]  --and eeiso.item_id = e.[position] 
WHERE es.status_detail_code ='D'
		AND es.tid = @tid 
		AND es.er_id = @reportid
		
END

