-- =============================================
-- Author:		Sushil Joshi
-- Create date: 10/26/2017
-- Description:	to get counselor list from couselor views
-- =============================================

Create PROCEDURE [dbo].[get_counselor_List] 
		
AS
BEGIN
	SET NOCOUNT ON;

  SELECT user_code,description,title 
	FROM counselor (nolock)
END