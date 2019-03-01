-- =============================================
-- Author:		Paras Bhandari
-- Create date: 03/13/2018
-- Description:	Added as part of User Story 2493. Returns tax documents for provided tid.
-- =============================================
CREATE PROCEDURE [dbo].[read_ee_doc] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		 doc_id
		,docName as doc_name
		,FileName as [file_name]
		,Category as category
		,dateAdded as date_added
		,doc_site
	FROM syn_ee_doc WITH(NOLOCK)
	WHERE tid =  @tid AND doc_site = 'T'
	ORDER BY dateAdded, docname
END