CREATE TABLE [dbo].[gg_move_plan] (
    [move_plan_id]   INT           IDENTITY (1, 1) NOT NULL,
    [title]          VARCHAR (250) NULL,
    [description]    VARCHAR (MAX) NULL,
    [section]        INT           NULL,
    [link_anchor]    VARCHAR (250) NULL,
    [tab_anchor]     VARCHAR (150) NULL,
    [page]           VARCHAR (250) NULL,
    [home_owner_old] BIT           NULL,
    [home_owner_new] BIT           NULL,
    [renter_old]     BIT           NULL,
    [renter_new]     BIT           NULL,
    [hhg_order]      BIT           NULL,
    [no_kids]        BIT           NULL,
    [no_spouse]      BIT           NULL,
    [active]         BIT           NULL,
    [svc_tab_id]     INT           NULL,
    CONSTRAINT [PK_gg_move_plan] PRIMARY KEY CLUSTERED ([move_plan_id] ASC)
);

