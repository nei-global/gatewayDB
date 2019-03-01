




CREATE PROC [dbo].[delete_ee_svc_detail]
	   @svc_cart_id int
      ,@tid varchar(10)
AS 
BEGIN 
 
    DELETE    
	FROM   syn_ee_svc_detail
    WHERE  (svc_cart_id = @svc_cart_id) and (tid = @tid)
END






