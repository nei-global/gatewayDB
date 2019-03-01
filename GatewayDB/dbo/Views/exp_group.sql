



CREATE VIEW [dbo].[exp_group]
AS
/*
08/30/17 snc updated to exclude column names that are not needed
12/08/17 jtp Added web_er_excl
*/
SELECT   code
		,[description]
		--,columnName as column_name
		--,BloombergName
		,0 as web_er_excl
FROM    syn_exp_group




