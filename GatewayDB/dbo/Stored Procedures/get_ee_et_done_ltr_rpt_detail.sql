


-- =============================================
-- Author:	Sushil Joshi
-- Create date: 03/1/2018
-- Description:	ee_et_done_ltr_rpt information based on provided tid.
-- =============================================
 CREATE PROCEDURE [dbo].[get_ee_et_done_ltr_rpt_detail] 
	@tid varchar(10)
AS
BEGIN
	  SELECT  
       et.[er_id]
      ,et.[item_id]
      ,et.[tran_date]
	  ,et.description as ExpenseDescription
      ,ec.[description] as ExpenseGroupDescription
      ,et.[amount]   
      ,et.[currency]
	  ,et.row_id
  FROM [dbo].[ee_et_done_ltr_rpt] et
  inner join 
  dbo.exp_code ec
  ON exp_code=ec.expense_code 
 WHERE tid=@tid

END



