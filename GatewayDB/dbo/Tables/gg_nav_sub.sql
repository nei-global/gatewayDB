CREATE TABLE [dbo].[gg_nav_sub] (
    [nav_sub_id]  INT           IDENTITY (1, 1) NOT NULL,
    [nav_id]      INT           NOT NULL,
    [title]       VARCHAR (50)  NOT NULL,
    [url]         VARCHAR (500) NULL,
    [description] VARCHAR (250) NULL,
    [new_window]  BIT           NOT NULL,
    [ordinal]     TINYINT       NOT NULL,
    [title_key]   VARCHAR (50)  NOT NULL,
    [inactive]    BIT           CONSTRAINT [DF_gg_nav_sub_inactive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [XPKgg_nav_sub] PRIMARY KEY CLUSTERED ([nav_sub_id] ASC),
    CONSTRAINT [R_15] FOREIGN KEY ([nav_id]) REFERENCES [dbo].[gg_nav] ([nav_id])
);

