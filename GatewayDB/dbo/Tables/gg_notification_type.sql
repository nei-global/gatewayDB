CREATE TABLE [dbo].[gg_notification_type] (
    [type_id]   INT          NOT NULL,
    [type_desc] VARCHAR (50) NULL,
    CONSTRAINT [PK_gg_notification_type] PRIMARY KEY CLUSTERED ([type_id] ASC)
);

