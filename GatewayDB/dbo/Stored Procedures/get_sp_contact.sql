
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 09/06/2017
-- Description:	Returns service provider contact for provided tid.{Modify Stored proc on 01/24/2018}
-- =============================================
CREATE PROCEDURE [dbo].[get_sp_contact] 
	-- Add the parameters for the stored procedure here
	@tid varchar(12)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid = null) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	SELECT distinct 
	spcnct.tid,
	spcnct.svc_nbr,
	spcnct.svc_type,
	spcnct.sp_name,
	spcnct.sp_contact_name,
	spcnct.svc_type_desc as description,	
    spcnct.sp_contact_phone,
	spcnct.sp_contact_email 
	
	FROM dbo.ee_sp_contact  AS spcnct WITH (nolock)
	 WHERE spcnct.tid=@tid order by spcnct.svc_type,spcnct.sp_name,spcnct.svc_nbr
END