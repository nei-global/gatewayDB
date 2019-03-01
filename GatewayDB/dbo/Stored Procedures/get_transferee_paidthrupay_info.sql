
-- Author:		Sushil Joshi
-- Create date: 1/19/2018
-- Description:	Returns co_company.
--						
-- =============================================
CREATE PROCEDURE [dbo].[get_transferee_paidthrupay_info] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS

Begin
Select cc.cono,cc.paid_thru_pay from  co_company cc where cc.cono=( substring(@tid,1,charindex('-',@tid)-1))
End