CREATE TABLE [dbo].[ee_move_plan_detail] (
    [move_plan_id] INT          NOT NULL,
    [tid]          VARCHAR (10) NOT NULL,
    [complete]     BIT          NULL,
    [enable]       BIT          NULL,
    CONSTRAINT [PK_ee_move_plan_detail] PRIMARY KEY CLUSTERED ([move_plan_id] ASC, [tid] ASC),
    CONSTRAINT [R_5] FOREIGN KEY ([move_plan_id]) REFERENCES [dbo].[gg_move_plan] ([move_plan_id])
);

