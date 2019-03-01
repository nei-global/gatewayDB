CREATE PROCEDURE [dbo].[get_company_name_list]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT cono, name, paid_thru_pay FROM dbo.co_company WITH(NOLOCK) WHERE inactive=1 order by name
END;
