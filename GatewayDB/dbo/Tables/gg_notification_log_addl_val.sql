CREATE TABLE [dbo].[gg_notification_log_addl_val] (
    [notification_id]           INT           NOT NULL,
    [notification_addl_type_id] INT           NOT NULL,
    [value]                     VARCHAR (255) NULL,
    CONSTRAINT [PK_gg_notification_log_addl_val] PRIMARY KEY CLUSTERED ([notification_id] ASC, [notification_addl_type_id] ASC)
);

