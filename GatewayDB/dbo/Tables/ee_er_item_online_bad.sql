CREATE TABLE [dbo].[ee_er_item_online_bad] (
    [item_id]      INT             IDENTITY (1, 1) NOT NULL,
    [er_id]        INT             NULL,
    [benefit_type] VARCHAR (50)    NULL,
    [category]     INT             NULL,
    [from_date]    DATE            NULL,
    [to_date]      DATE            NULL,
    [description]  VARCHAR (MAX)   NULL,
    [amount]       DECIMAL (18, 2) NULL,
    [currency]     VARCHAR (5)     NULL,
    [status]       BIT             NULL
);

