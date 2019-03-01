CREATE TABLE [dbo].[utility_log_level] (
    [level_id]    TINYINT        IDENTITY (1, 1) NOT NULL,
    [name]        NVARCHAR (50)  NOT NULL,
    [description] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_utility_log_level] PRIMARY KEY CLUSTERED ([level_id] ASC)
);

