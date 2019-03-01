





-- =============================================
-- Author:		Sushil Joshi
-- Create date: 09/08/2017
-- Description:	Returns submitted expense report data only for provided tid.
--
-- Revision History
-- 06/28/18 snc: 6331 modifying joins to allow selection of ERs not submitted on the web
-- =============================================
CREATE PROCEDURE [dbo].[get_submitExpense_report] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid IS NULL) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	 SELECT 
		 eers.tid,
		 eers.er_id,
		 eers.create_date,
		 eers.recd_date,
		 eers.description,
		 eers.status_detail_code,
		 eers.req_amt,
		 eers.req_currency,
		 eers.disb_amt,
		 eers.disb_curr,
		 eers.process_date
	 FROM dbo.ee_er_summary_online eers WITH (NOLOCK)
--	 INNER JOIN dbo.syn_ee_er_online seer WITH (NOLOCK)
--	 ON eers.er_id=seer.expRpt_nbr
	 WHERE eers.tid=@tid
--	 and seer.IsSubmitted=1
	 and description is not null
	 and req_currency is not null

END




