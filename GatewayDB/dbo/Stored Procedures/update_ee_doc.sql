
/*
* 02/19/2018 snc: created
*/
CREATE PROCEDURE [dbo].[update_ee_doc]
		@doc_id int,
		@TID varchar(10),
		@cono varchar(5),
		@doc_name varchar(200),
		@file_name varchar(200),
		@category varchar(50),
		@type varchar(5),
		@doc_site char(1)
	 
AS
BEGIN

BEGIN TRANSACTION;
	--Set @cono = dbo(get
	UPDATE syn_ee_doc
	SET		doc_id = ISNULL(@doc_id,doc_id),  
			tid = ISNULL(@TID,tid),
			cono = dbo.get_CONO(@tid),
			docname = ISNULL(@doc_name,docname),  
			[FileName] = ISNULL(@file_name,[FileName]),  
			category = ISNULL(@category,category),
			FileType = ISNULL(@type,FileType),
			doc_site = ISNULL(@doc_site,doc_site)
	WHERE doc_id = @doc_id


COMMIT TRANSACTION;

END







