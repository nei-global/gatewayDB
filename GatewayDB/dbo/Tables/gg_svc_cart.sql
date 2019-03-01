CREATE TABLE [dbo].[gg_svc_cart] (
    [svc_cart_id]    INT           IDENTITY (1, 1) NOT NULL,
    [svc_cart_title] VARCHAR (250) NULL,
    [ordinal]        INT           NULL,
    [active]         BIT           NULL,
    [move_plan_id]   INT           NULL,
    [sp_type]        VARCHAR (5)   NULL,
    [email_type_id]  INT           NULL,
    CONSTRAINT [PK_gg_srvc_cart] PRIMARY KEY CLUSTERED ([svc_cart_id] ASC),
    CONSTRAINT [R_7] FOREIGN KEY ([move_plan_id]) REFERENCES [dbo].[gg_move_plan] ([move_plan_id])
);

