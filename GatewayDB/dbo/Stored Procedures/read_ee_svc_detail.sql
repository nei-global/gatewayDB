





-- =============================================
-- Author:	Greg Miller
-- =============================================
CREATE PROCEDURE [dbo].[read_ee_svc_detail] 
	   @svc_cart_id int
      ,@tid varchar(10)
AS
BEGIN
	SELECT [svc_cart_id]
      ,[tid]
      ,[order_date] 
	FROM syn_ee_svc_detail 
	WHERE svc_cart_id = @svc_cart_id and tid = @tid;
END






