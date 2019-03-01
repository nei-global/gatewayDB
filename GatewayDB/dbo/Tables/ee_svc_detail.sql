CREATE TABLE [dbo].[ee_svc_detail] (
    [svc_cart_id] INT          NOT NULL,
    [tid]         VARCHAR (10) NOT NULL,
    [order_date]  DATETIME     NULL,
    CONSTRAINT [PK_ee_srvc_detail] PRIMARY KEY CLUSTERED ([svc_cart_id] ASC, [tid] ASC),
    CONSTRAINT [R_6] FOREIGN KEY ([svc_cart_id]) REFERENCES [dbo].[gg_svc_cart] ([svc_cart_id])
);

