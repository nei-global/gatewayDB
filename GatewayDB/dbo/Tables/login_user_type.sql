CREATE TABLE [dbo].[login_user_type] (
    [user_type]   VARCHAR (4)  NOT NULL,
    [description] VARCHAR (50) NULL,
    CONSTRAINT [XPKlogin_user_type] PRIMARY KEY CLUSTERED ([user_type] ASC)
);

