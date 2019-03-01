CREATE TABLE [dbo].[login_security_question] (
    [security_id] INT           IDENTITY (1, 1) NOT NULL,
    [question]    VARCHAR (250) NOT NULL,
    CONSTRAINT [XPKlogin_security_question] PRIMARY KEY CLUSTERED ([security_id] ASC)
);

