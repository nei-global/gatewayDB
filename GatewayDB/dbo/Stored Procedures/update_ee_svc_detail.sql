



CREATE PROCEDURE [dbo].[update_ee_svc_detail]
	   @svc_cart_id int
      ,@tid varchar(10)
      ,@order_date datetime = NULL
	 
AS
BEGIN

	UPDATE syn_ee_svc_detail
	SET	svc_cart_id = ISNULL(@svc_cart_id,svc_cart_id)
      ,tid = ISNULL(@tid,tid)
      ,order_date = ISNULL(@order_date,order_date)
	WHERE svc_cart_id = @svc_cart_id and tid = @tid

END	





