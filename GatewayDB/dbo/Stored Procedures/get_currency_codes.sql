
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 07/31/2017
-- Description:	Returns Currency Codes.

-- =============================================

CREATE PROCEDURE [dbo].[get_currency_codes] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT code,country 
FROM  [dbo].[currency_codes]
ORDER BY 
	CASE WHEN country LIKE '%United States%' 
	THEN '0' 
	ELSE code 
	END

END


