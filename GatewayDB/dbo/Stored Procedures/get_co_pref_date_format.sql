

/*
* 11/07/18 mkb: created
*/
CREATE PROCEDURE [dbo].[get_co_pref_date_format] 
	@cono varchar(3)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT cono, 
		CASE	
			WHEN pref_date_format = 'DD/MM/YY' 
			THEN 'dd/MM/yy'

			WHEN pref_date_format = 'DD/MM/YYYY'
			THEN 'dd/MM/yyyy'

			WHEN pref_date_format = 'DD MON YY'
			THEN 'dd MMM yy'

			WHEN pref_date_format = 'DD MON YYYY'
			THEN 'dd MMM yyyy'

			WHEN pref_date_format = 'DD Month YY'
			THEN 'dd MMMM yy'

			WHEN pref_date_format = 'DD Month YYYY'
			THEN 'dd MMMM yyyy'

			WHEN pref_date_format = 'MM/DD/YY'
			THEN 'MM/dd/yy'
			
			WHEN pref_date_format = 'MM/DD/YYYY'
			THEN 'MM/dd/yyyy'

			WHEN pref_date_format = 'MON DD YY'
			THEN 'MMM dd yy'

			WHEN pref_date_format = 'MON DD YYYY'
			THEN 'MMM dd yyyy'

			WHEN pref_date_format = 'Month DD, YYYY'
			THEN 'MMMM dd, yyyy'

			WHEN pref_date_format = 'YY MON DD'
			THEN 'yy MMM dd'

			WHEN pref_date_format = 'YYYY Month DD'
			THEN 'yyyy MMMM dd'

			ELSE 'MM/dd/yyyy'

		END as pref_date_format
		FROM co_company
		WHERE cono = @cono
END



