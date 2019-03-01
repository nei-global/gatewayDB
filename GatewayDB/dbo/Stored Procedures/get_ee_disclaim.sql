





/*
* 11/02/18 mkb: created
* 11/27/18 mkb: adjusted to return is fd.begin_date and fd.end_date is null
* 11/27/18 srj: adjusted to select cono also so that same object GgFormDisclaimer in .net can be used for retrieving data from this stored proc
* 01/28/19 mla: removed the hardcoded cono values
*/

CREATE PROCEDURE [dbo].[get_ee_disclaim] 
	@tid varchar(10),
	@nei_site varchar(1),
	@form_name varchar(50)
AS
BEGIN

declare @cono varchar(10) = dbo.get_CONO(@tid)

SELECT 
	---446/546 er disclaimer critera
	fd.cono,
	CASE 
		WHEN --ec.cono IN (446,546) AND 
			ej.co_move_type = 'DOM'
		THEN fd.disclaimer

		WHEN --ec.cono IN (446,546) AND 
			ej.co_move_type is null AND ep.move_type IN ('DOM INTER','DOM INTRA','UNDETERMINED')
		THEN fd.disclaimer

		ELSE NULL
	END AS disclaimer

FROM ee_profile ep
	JOIN ee_job ej
		ON ep.tid = ej.tid
	--JOIN ee_cono ec
	--	ON ep.tid = ec.tid
	JOIN gg_form_disclaimer fd
		ON fd.cono = @cono
WHERE ep.tid = @tid
		AND fd.nei_site = @nei_site
		AND fd.form_name = @form_name
		AND fd.inactive <> '1'
		AND (fd.begin_date is null or begin_date <= GETDATE())
		AND(fd.end_date is null or end_date > GETDATE())

END


