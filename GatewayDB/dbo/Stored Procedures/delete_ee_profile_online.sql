

-- 2018-06-22  JET tfs 5927 convert ee_profile_online to a view of nei_website data
-- 2018-06-26  JET TFS 5927 Changed to use the renamed Synonym.

CREATE PROC [dbo].[delete_ee_profile_online]
	@tid varchar(10)
AS 
BEGIN 
 

	DELETE    
	FROM  [syn_transfer_login]
	WHERE  tid = @tid


END





