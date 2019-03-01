/*
	6/19/2018 - JET Created	TFS 6081 
	9/28/2018- SRJ Updated stored proc to include title, that is used to disply general login note in dashboard.

*/
CREATE PROCEDURE [dbo].[read_loginnote]
	@note_type char(1) = NULL
AS 
BEGIN 
 
    SELECT  
	   [loginNoteText] as login_note
      ,[noteType] as type
	  ,[gen_login_title] as title
  FROM [syn_loginNote]
  WHERE  IIF(@note_type is null,notetype,@note_type)  = notetype
   
END





