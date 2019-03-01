
-- =============================================
-- Author:		Sushil Joshi
-- Create date: 09/07/2017
-- Description:	Returns saved expense report data only for provided tid.
-- =============================================
CREATE PROCEDURE [dbo].[get_savedexpense_report] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@tid IS NULL) BEGIN
		RAISERROR('Parameter @tid is required', 16, 1);
	END;

	 select distinct
	 eeer.tid,
	 eeer.er_Id as er_id_auto,
	 eeer.expRpt_Nbr as er_id,
	 eeer.createDate as create_date,
	 eeitem.benefit_type 
	 from [dbo].[syn_ee_er_item_online]  as eeitem with (nolock)
			inner join [dbo].[syn_ee_er_online]  as eeer with (nolock)
			on eeer.er_id= eeitem.er_id
	where eeer.isSubmitted=0
		 and tid=@tid 
		 and eeitem.benefit_type is not null
END