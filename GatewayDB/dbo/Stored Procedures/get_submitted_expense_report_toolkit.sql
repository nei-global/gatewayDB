
-- =============================================
-- Author:		Paras Bhandari
-- Create date: 09/12/2017
-- Description:	Returns submitted expense report data only for provided tid or reportid.
-- =============================================
CREATE PROCEDURE [dbo].[get_submitted_expense_report_toolkit] 
	-- Add the parameters for the stored procedure here
	 @tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid IS NULL) BEGIN
		RAISERROR('Parameter either @tid or @reportid is required', 16, 1);
	END;

	SELECT tid
		  ,er_id
		  ,create_date
		  ,recd_date AS submit_date
		  ,description
		  ,status_detail_code
		  ,req_currency AS currency
		  ,req_amt 
	FROM dbo.ee_er_summary_online WITH(NOLOCK)
	WHERE tid=@tid AND description IS NOT NULL
	UNION ALL
	SELECT DISTINCT 
		  r.tid
		 ,r.er_id
		 ,r.create_date
		 ,r.submit_date
		 ,e.Benefit_Type AS description
		 ,'Pending' AS status_detail_code
		 ,e.currency
		 ,e.amount as req_amt
	FROM ee_er_online r WITH(NOLOCK) 
	INNER JOIN ee_er_item_online e WITH(NOLOCK) ON r.er_id_auto = e.er_id_auto
	WHERE r.tid = @tid
		AND r.er_id_auto = e.er_id_auto 
		AND r.status = 1 
		AND 'W-'+convert(varchar(10),e.er_id_auto) NOT IN 
		(
			SELECT er_id
			FROM ee_er WITH(NOLOCK)
			WHERE tid = @tid
		)
		AND r.er_id_auto = e.er_id_auto
		AND e.benefit_type IS NOT NULL;
END;