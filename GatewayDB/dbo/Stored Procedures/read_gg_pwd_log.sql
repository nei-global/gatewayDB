
-- =============================================
-- 07/05/18 snc: Created
-- 11/12/18 mkb: removed dynamic sql
-- =============================================
CREATE PROCEDURE [dbo].[read_gg_pwd_log] 
	-- Add the parameters for the stored procedure here
	@userid varchar(10),
	@password varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--Declare @SQLQuery as nvarchar(1000)
--set @SQLQuery = 
	SELECT 
		 cono
		,userid as [user_id]
		,[password] as [password]
		,password_set_date as pwd_date
		,expired
	FROM syn_transfer_login_pwdLog WITH(NOLOCK)
	WHERE userid = @userid
		AND (@password is null	
			OR [password] = @password)
	ORDER BY pwd_date
	--WHERE ([userid] = '''+ @userid+''')' 

--If @password is not null
--	Set @SQLQuery = @SQLQuery + ' And (password = '''+@password+''')'

--Set @SQLQuery = @SQLQuery + ' ORDER BY pwd_date'

--Execute sp_executesql @SQLQuery
END
