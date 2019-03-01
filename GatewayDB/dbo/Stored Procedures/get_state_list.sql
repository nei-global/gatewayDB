
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 11/27/2017
-- Description:	Returns State List.

-- =============================================

CREATE  PROCEDURE [dbo].[get_state_list] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT code,description  
FROM  [dbo].[nei_state]
ORDER BY  description 


END

