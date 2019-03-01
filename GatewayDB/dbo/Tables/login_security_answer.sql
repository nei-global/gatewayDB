CREATE TABLE [dbo].[login_security_answer] (
    [user_name]   VARCHAR (150) NOT NULL,
    [security_id] INT           NOT NULL,
    [response]    VARCHAR (100) NOT NULL,
    CONSTRAINT [XPKlogin_security_answer] PRIMARY KEY CLUSTERED ([user_name] ASC, [security_id] ASC),
    CONSTRAINT [R_login_login_security_answer] FOREIGN KEY ([user_name]) REFERENCES [dbo].[login] ([user_name]),
    CONSTRAINT [R_login_question_login_answer] FOREIGN KEY ([security_id]) REFERENCES [dbo].[login_security_question] ([security_id])
);

