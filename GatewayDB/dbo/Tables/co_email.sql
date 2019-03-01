CREATE TABLE [dbo].[co_email] (
    [co_email_id]   INT           IDENTITY (1, 1) NOT NULL,
    [cono]          INT           NOT NULL,
    [nei_site]      VARCHAR (1)   NULL,
    [form_name]     VARCHAR (50)  NULL,
    [email_address] VARCHAR (150) NULL,
    [begin_date]    DATE          NULL,
    [end_date]      DATE          NULL,
    CONSTRAINT [PK_co_email] PRIMARY KEY CLUSTERED ([co_email_id] ASC)
);

