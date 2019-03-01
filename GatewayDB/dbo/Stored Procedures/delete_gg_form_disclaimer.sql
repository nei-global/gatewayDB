
/*
* 10/31/18 snc: Created
*/ 

CREATE PROC [dbo].[delete_gg_form_disclaimer]
	@id int
AS 
BEGIN 
 
    DELETE    
	FROM   gg_form_disclaimer 
    WHERE  (id = @id)

END




