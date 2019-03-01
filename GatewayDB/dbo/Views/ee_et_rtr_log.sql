


/*
* 02/08/18 snc: Created
* 
*/

CREATE VIEW [dbo].[ee_et_rtr_log]
AS
SELECT tid
      ,year_end_no as year
      ,[type]
      ,[sent] as sent_datetime
  FROM syn_ee_et_rtr_log





