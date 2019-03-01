

/*
* 02/19/18 snc: created
* 04/17/2018 Paras | User Story 4387: Removed @cono parameter since it is not being used in proc and cono is being returned from function dbo.get_CONO. So,
*			Declared @cono as local variable.
*/

CREATE PROCEDURE [dbo].[create_ee_doc]		
		@TID varchar(10),
		@doc_name varchar(200),
		@file_name varchar(200),
		@category varchar(50),
		@type varchar(5),
		@doc_site char(1)
	 
AS
BEGIN
	DECLARE @cono varchar(3);
	SET @cono = dbo.get_CONO(@tid)
	INSERT INTO syn_ee_doc(
		   [TID]
		  ,[cono]
		  ,[docName] --as doc_name
		  ,[FileName] --as [file_name]
		  ,[Category]
		  ,[dateAdded] --as add_date
		  ,[FileType] --as [type]
		  ,[doc_site]
			)
	VALUES (		
		@tid,
		@cono,
		@doc_name,
		@file_name,
		@category,
		getdate(),
		@type,
		@doc_site)
END



