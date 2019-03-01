CREATE TABLE [dbo].[gg_nav] (
    [nav_id]     INT           IDENTITY (1, 1) NOT NULL,
    [user_type]  VARCHAR (4)   NOT NULL,
    [title]      VARCHAR (50)  NOT NULL,
    [url]        VARCHAR (500) NULL,
    [icon]       VARCHAR (50)  NULL,
    [desciption] VARCHAR (250) NULL,
    [new_window] BIT           NOT NULL,
    [ordinal]    TINYINT       NOT NULL,
    [title_key]  VARCHAR (50)  NOT NULL,
    [inactive]   BIT           CONSTRAINT [DF_gg_nav_inactive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [XPKgg_nav] PRIMARY KEY CLUSTERED ([nav_id] ASC),
    CONSTRAINT [FK_gg_nav_login_user_type] FOREIGN KEY ([user_type]) REFERENCES [dbo].[login_user_type] ([user_type])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_gg_nav]
    ON [dbo].[gg_nav]([title_key] ASC);

