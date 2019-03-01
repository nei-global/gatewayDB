




/*
* 12/06/18 mkb: created
* 12/10/18 mla: made the cont_type nullable
* 1/17/19 mla: commented out the cont_desc per US 9012
*/
CREATE PROCEDURE [dbo].[get_ee_contact] 
	@tid varchar(10),
	@cont_type varchar(10) = null

AS
BEGIN
	SELECT 
		tid,
		cont_type,
		cont_info
--		cont_desc
	FROM ee_contact
	WHERE tid =  @tid 
		AND (@cont_type is null or cont_type = @cont_type)
	group by tid,
		cont_type,
		cont_info
--		cont_desc
END

