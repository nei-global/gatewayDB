
/*
2018-06-19 JET TFS 6081
		creates new records in syn_loginnote
		

*/

CREATE PROCEDURE [dbo].[create_loginnote]
		@loginNoteText [varchar](3000),
		@Type [char](1) 	 
AS

BEGIN
	

	INSERT INTO syn_loginnote(
			[loginNoteText],
			[noteType])
		VALUES (
			@loginNoteText,
			@Type);
	
	
	
END	

