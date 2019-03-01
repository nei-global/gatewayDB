CREATE TABLE [dbo].[ee_login] (
    [user_name] VARCHAR (150) NOT NULL,
    [tid]       VARCHAR (10)  NOT NULL,
    [user_nbr]  INT           NOT NULL,
    CONSTRAINT [XPKee_login] PRIMARY KEY CLUSTERED ([user_name] ASC, [tid] ASC),
    CONSTRAINT [R_ee_profile_online_ee_login] FOREIGN KEY ([tid]) REFERENCES [dbo].[ee_profile_online_old] ([tid]),
    CONSTRAINT [R_login_ee_login] FOREIGN KEY ([user_name]) REFERENCES [dbo].[login] ([user_name])
);

