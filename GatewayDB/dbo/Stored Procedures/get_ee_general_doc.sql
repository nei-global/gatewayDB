



-- =============================================
-- Author:		Paras Bhandari
-- Create date: 03/13/2018
-- Description:	Added as part of User Story 2493. Returns general documents for provided tid.
--Comments:Added type H as per user story 5103  by Dilshad and added inactive filter for user story 5103
--Comments:Added type DD ,CS by Dilshad as per US7395 and task 7455 and 7454
-- 09/24/2018 - JET - TFS 7715 - update the documents section to take into account the ordinal within the sub sections, so that the documents are shown as requested
--								with nulls at the bottom of the list.
-- 10/19/18 mkb: updated formatting, changed IFF to ISNULL	
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_general_doc] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		  ewf.web_form_id
		 ,nwf.description
		 ,nwf.type
		 ,nwf.upload
	FROM dbo.nei_web_form nwf
		INNER JOIN dbo.ee_web_form ewf 
			ON nwf.web_form_id = ewf.web_form_id
	WHERE (ewf.tid = @tid) AND (nwf.type IN ('Z', 'E', 'M', 'A', 'AG', 'T','H','DD','CS'))
		AND (nwf.ee_inactive =0 OR nwf.ee_inactive is null)
	ORDER BY ISNULL([rank],'99999')
	--ORDER BY IIF([rank] is null,'99999',[rank])

END

