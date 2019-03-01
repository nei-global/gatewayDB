CREATE TABLE [dbo].[ee_er_item_online_log] (
    [item_id]      INT             NOT NULL,
    [Er_id]        INT             NOT NULL,
    [Benefit_Type] VARCHAR (50)    NOT NULL,
    [Category]     INT             NOT NULL,
    [From_dt]      SMALLDATETIME   NOT NULL,
    [To_dt]        SMALLDATETIME   NOT NULL,
    [Description]  VARCHAR (3500)  NOT NULL,
    [Amount]       DECIMAL (18, 2) NOT NULL,
    [Currency]     VARCHAR (5)     NULL,
    [isSubmitted]  BIT             NOT NULL,
    [create_date]  DATETIME        NULL,
    [last_updated] DATETIME        NULL,
    [delete_date]  DATETIME        NULL
);

