/*
* 02/19/18 snc: Created
*/ 

CREATE PROC [dbo].[delete_ee_doc]
	@doc_id int
AS 
BEGIN 
 
    DELETE    
	FROM   syn_ee_doc 
    WHERE  (doc_id = @doc_id)

END



