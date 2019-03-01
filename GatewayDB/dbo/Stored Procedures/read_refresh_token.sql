
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 04/04/2018
-- Description:	For given tid we are getting  token and token_date
-- =============================================
CREATE PROC [dbo].[read_refresh_token]
    @tid varchar(10)
AS 
BEGIN 
    SELECT 
	   [tid]
      ,[token]
	  ,[token_expire_date]
  FROM [dbo].[refresh_token] WITH(NOLOCK)
  WHERE  (tid = @tid);
END

