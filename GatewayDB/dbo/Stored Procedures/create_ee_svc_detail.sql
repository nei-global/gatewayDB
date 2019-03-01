









CREATE PROCEDURE [dbo].[create_ee_svc_detail]
	   @svc_cart_id int
      ,@tid varchar(10)
      ,@order_date datetime
	 
AS
BEGIN
INSERT INTO syn_ee_svc_detail(
	   [svc_cart_id]
      ,[tid]
      ,[order_date]
		)
    VALUES (
	   @svc_cart_id
      ,@tid
      ,@order_date)

END













