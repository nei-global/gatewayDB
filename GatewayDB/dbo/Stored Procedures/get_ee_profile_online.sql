

-- =============================================
-- Author:		Dilshad Shaik
-- Create date: 02/15/2018
-- Description:	<Description,,>
--08/10/2018  - JET - TFS-7163   replace the "[nei_gateway_dev].[dbo].[ee_profile_online] reference with [syn_ee_profile_online]
-- =============================================
CREATE PROCEDURE [dbo].[get_ee_profile_online] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;
    -- Insert statements for procedure here
	SELECT  tid
      ,orig_addr
      ,orig_city
      ,orig_state
      ,orig_zip
      ,orig_country     
      ,dest_addr
      ,dest_city
      ,dest_state
      ,dest_zip
      ,dest_country
      
  FROM [syn_ee_profile_online] where tid=@tid
END

