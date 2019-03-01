
-- Author:		Sushil Joshi
-- Create date: 10/03/2017
-- Description:	Returns orig_rcpt and move_type information only for provided tid.
--						
-- =============================================
CREATE PROCEDURE [dbo].[get_transferee_origrcpt_info] 
	-- Add the parameters for the stored procedure here
	@tid varchar(10)
AS

Begin

select eep.tid, cc.orig_rcpt, eep.move_type,cc.orig_rcpt_intl,cc.paid_thru_pay from  co_company cc
inner join ee_profile eep
on cc.cono=( substring(eep.tid,1,charindex('-',eep.tid)-1))
where tid=@tid

End