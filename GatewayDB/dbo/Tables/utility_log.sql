CREATE TABLE [dbo].[utility_log] (
    [log_id]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [application_id] TINYINT        NOT NULL,
    [logged_date]    DATETIME       CONSTRAINT [DF_utilities_log_logged_date] DEFAULT (getdate()) NOT NULL,
    [level_id]       TINYINT        NOT NULL,
    [url]            NVARCHAR (MAX) NULL,
    [action]         NVARCHAR (500) NULL,
    [message]        NVARCHAR (MAX) NOT NULL,
    [logger]         NVARCHAR (250) NULL,
    [callsite]       NVARCHAR (MAX) NULL,
    [exception]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_utilities_log] PRIMARY KEY CLUSTERED ([log_id] ASC),
    CONSTRAINT [FK_utility_log_utility_log_application] FOREIGN KEY ([application_id]) REFERENCES [dbo].[utility_log_application] ([application_id]),
    CONSTRAINT [FK_utility_log_utility_log_level] FOREIGN KEY ([level_id]) REFERENCES [dbo].[utility_log_level] ([level_id])
);

