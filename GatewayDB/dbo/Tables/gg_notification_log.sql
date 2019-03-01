CREATE TABLE [dbo].[gg_notification_log] (
    [notification_id]      INT           IDENTITY (1, 1) NOT NULL,
    [notification_type_id] INT           NOT NULL,
    [tid]                  VARCHAR (10)  NULL,
    [subject]              VARCHAR (255) NULL,
    [recipient]            VARCHAR (255) NULL,
    [copy]                 VARCHAR (255) NULL,
    [blind_copy]           VARCHAR (255) NULL,
    [sender]               VARCHAR (255) NULL,
    [body]                 VARCHAR (MAX) NULL,
    [sent_date]            DATETIME      NULL,
    CONSTRAINT [PK_gg_notification_log] PRIMARY KEY CLUSTERED ([notification_id] ASC)
);

