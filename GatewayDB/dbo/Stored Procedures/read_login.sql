-- =============================================
-- Author:		Paras Bhandari
-- Create date: 03/12/2018
-- Description:	User Story - 4319. Created to read data from dbo.login table based on user_name.
--					I have only selected user_name and login_token for now. If we need more fields in future requirement, we can add it later.
--				User Story - 5423 |Task - 5666. Updated to get data from dbo.nei_login view.
-- =============================================
CREATE PROC [dbo].[read_login]
    @user_name varchar(150)
AS 
BEGIN 
    SELECT 
	   [user_name]
      ,[login_token]
  FROM [dbo].[nei_login] WITH(NOLOCK)
  WHERE  (user_name = @user_name);
END

