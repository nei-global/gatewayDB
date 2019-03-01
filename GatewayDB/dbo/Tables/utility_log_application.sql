CREATE TABLE [dbo].[utility_log_application] (
    [application_id] TINYINT        IDENTITY (1, 1) NOT NULL,
    [name]           NVARCHAR (100) NOT NULL,
    [description]    NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_utilities_log_applications] PRIMARY KEY CLUSTERED ([application_id] ASC)
);

