CREATE TABLE [dbo].[gg_ee_calendar] (
    [tid]            VARCHAR (10)  NOT NULL,
    [taskid]         INT           IDENTITY (1, 1) NOT NULL,
    [title]          VARCHAR (100) NOT NULL,
    [description]    VARCHAR (MAX) NULL,
    [start_date]     DATETIME      NOT NULL,
    [end_date]       DATETIME      NOT NULL,
    [isallday_event] BIT           DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([taskid] ASC)
);

