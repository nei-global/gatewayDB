
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 04/04/2018
-- Description:US4797--Insert/update record in refresh_token
-- =============================================

CREATE PROC [dbo].[insert_refresh_token]
    @tid varchar(10),
	@token varchar(75),
	@token_expire_date datetime
AS 
BEGIN 

    IF EXISTS (SELECT 1 FROM [dbo].[refresh_token] where tid=@tid)/*If Record exists for that tId in refresh_token table Update record else insert new record*/
	BEGIN
		UPDATE RT
		SET RT.token=@token,
			RT.token_expire_date=@token_expire_date
		FROM [dbo].[refresh_token] RT
		WHERE RT.tid = @tid
	END
	ELSE
	BEGIN
		 INSERT INTO [dbo].[refresh_token](tid,token,token_expire_date)
		 VALUES(@tid,@token,@token_expire_date)
	END   
END