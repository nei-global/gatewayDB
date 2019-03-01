CREATE TABLE [dbo].[gg_video_links] (
    [code]         VARCHAR (10)  NOT NULL,
    [url_location] VARCHAR (MAX) NULL,
    CONSTRAINT [AK_code] UNIQUE NONCLUSTERED ([code] ASC)
);

