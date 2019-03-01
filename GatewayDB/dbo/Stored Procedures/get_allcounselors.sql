-- =============================================
-- Author:		Dutch Dasanaike
-- Create date: 7/12/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_allcounselors] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT user_code, description, title FROM counselor where Inactive='0' order by description

END
