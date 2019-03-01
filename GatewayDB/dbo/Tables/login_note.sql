CREATE TABLE [dbo].[login_note] (
    [login_note] VARCHAR (MAX) NULL,
    [type]       CHAR (1)      NOT NULL,
    CONSTRAINT [PK_login_note] PRIMARY KEY NONCLUSTERED ([type] ASC) WITH (FILLFACTOR = 90)
);

