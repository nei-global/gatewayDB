/*
2018-07-10   JET TFS-
			discontunuing the boolean and Returning the results.

*/
CREATE PROCEDURE [dbo].[get_gg_valid_pwd]		
		@userid varchar(10),
		@password varchar(200)
	 
AS
BEGIN
DECLARE	@return_value int

declare @returnset table (cono int,
		user_id varchar(25),
		password varchar(150),
		pwd_date datetime,
		expired bit)

set nocount on

--insert into @returnset(cono, user_id, password, pwd_date, expired)
EXEC	dbo.read_gg_pwd_log 
			@userid,
			@password
			/*
if (select count(*) from @returnset) = 0 
--	SELECT	'result' = 1
	set @return_value = 1
else
--	Select 'result' = 0
	set @return_value = 0

	set nocount off

	---select @return_value as result
	Select * from @returnset
	*/
END
