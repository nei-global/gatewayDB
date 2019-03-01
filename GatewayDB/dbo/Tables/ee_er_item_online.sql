CREATE TABLE [dbo].[ee_er_item_online] (
    [item_id]      INT             IDENTITY (1, 1) NOT NULL,
    [er_id_auto]   INT             NOT NULL,
    [benefit_type] VARCHAR (50)    NULL,
    [category]     INT             NULL,
    [from_date]    DATE            NOT NULL,
    [to_date]      DATE            NOT NULL,
    [description]  VARCHAR (MAX)   NULL,
    [amount]       DECIMAL (18, 2) NOT NULL,
    [currency]     VARCHAR (5)     NOT NULL,
    [status]       BIT             NULL,
    [create_date]  DATETIME        CONSTRAINT [DF_ee_er_item_online_create_date] DEFAULT (getdate()) NULL,
    [last_updated] DATETIME        CONSTRAINT [DF_ee_er_item_online_last_updated] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ee_er_item_online] PRIMARY KEY CLUSTERED ([item_id] ASC),
    CONSTRAINT [FK_ee_er_item_online_ee_er_online] FOREIGN KEY ([er_id_auto]) REFERENCES [dbo].[ee_er_online] ([er_id_auto]) ON DELETE CASCADE
);

