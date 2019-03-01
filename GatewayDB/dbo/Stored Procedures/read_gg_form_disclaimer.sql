



/*
*	10/31/18 snc: Created
*/

CREATE PROC [dbo].[read_gg_form_disclaimer]
    @cono int,
	@nei_site varchar(1),
	@form_name varchar(50)

AS 
BEGIN 

DECLARE @active_date date
	SET @active_date = GETDATE()

    SELECT  
			[cono]
			,[disclaimer]
	FROM [gg_form_disclaimer]
	INNER JOIN nei_site ns
		on nei_site = ns.code
    WHERE  cono = @cono 
			and  nei_site = @nei_site
			and form_name = @form_name
--			and ([begin_date] <= @active_date and [end_date] >= @active_date)
			and (begin_date is null or begin_date <= @active_date)
			and (end_date is null or end_date > @active_date)
			and isnull(inactive, 0) <> 1
END


