-- =============================================
-- Author:		Sushil Joshi
-- Create date: 11/27/2017
-- Description:	Returns Country List.

-- =============================================

CREATE  PROCEDURE [dbo].[get_country_list] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


select code,description,currency  from  [dbo].[nei_country]
order by 
case when description like '%United States%' 
then '0' 
else description 
End
END

