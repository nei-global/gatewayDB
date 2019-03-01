
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 05/02/2018
-- Description:	For given cono we are getting  web_er and cname
-- =============================================
CREATE PROC [dbo].[get_ee_company_info]
    @cono int
AS 
BEGIN 
    SELECT 
	   [cono]
      ,[web_er]
	  ,[cname]
  FROM [dbo].[company] WITH(NOLOCK)
  WHERE  (cono = @cono);
END

