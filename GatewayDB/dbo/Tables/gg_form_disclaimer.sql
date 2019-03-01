CREATE TABLE [dbo].[gg_form_disclaimer] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [cono]       INT           NULL,
    [nei_site]   VARCHAR (1)   NULL,
    [form_name]  VARCHAR (50)  NULL,
    [disclaimer] VARCHAR (MAX) NULL,
    [begin_date] DATE          NULL,
    [end_date]   DATE          NULL,
    [inactive]   BIT           NULL,
    CONSTRAINT [PK_gg_form_disclaimer] PRIMARY KEY CLUSTERED ([id] ASC)
);

