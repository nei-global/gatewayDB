CREATE TABLE [dbo].[login_password_history] (
    [pwd_hist_id]  INT           IDENTITY (1, 1) NOT NULL,
    [user_name]    VARCHAR (150) NULL,
    [pwd_set_date] DATETIME      NULL,
    [inactive]     BIT           NULL,
    [password]     VARCHAR (150) NOT NULL,
    CONSTRAINT [XPKlogin_password_history] PRIMARY KEY CLUSTERED ([pwd_hist_id] ASC),
    CONSTRAINT [R_login_login_password_history] FOREIGN KEY ([user_name]) REFERENCES [dbo].[login] ([user_name])
);

