CREATE TABLE [dbo].[login] (
    [user_name]        VARCHAR (150) NOT NULL,
    [password]         VARCHAR (150) NOT NULL,
    [attempt_no]       INT           NOT NULL,
    [force_reset]      BIT           NOT NULL,
    [opt_in]           DATE          NULL,
    [last_login]       DATETIME      NULL,
    [2_factor_phone]   VARCHAR (25)  NULL,
    [status]           VARCHAR (5)   NOT NULL,
    [user_type]        VARCHAR (4)   NOT NULL,
    [preferred_email]  VARCHAR (150) NULL,
    [reset_pin]        INT           NULL,
    [reset_pin_date]   DATETIME      NULL,
    [reset_pin_phone]  VARCHAR (25)  NULL,
    [login_token]      VARCHAR (75)  NULL,
    [login_token_date] DATETIME      NULL,
    CONSTRAINT [XPKlogin] PRIMARY KEY CLUSTERED ([user_name] ASC),
    CONSTRAINT [R_login_login_status] FOREIGN KEY ([status]) REFERENCES [dbo].[login_status] ([status]),
    CONSTRAINT [R_login_login_user_type] FOREIGN KEY ([user_type]) REFERENCES [dbo].[login_user_type] ([user_type])
);

