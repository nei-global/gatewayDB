CREATE TABLE [dbo].[login_status] (
    [status]      VARCHAR (5)   NOT NULL,
    [description] VARCHAR (50)  NULL,
    [message]     VARCHAR (MAX) NULL,
    CONSTRAINT [XPKlogin_status] PRIMARY KEY CLUSTERED ([status] ASC)
);

