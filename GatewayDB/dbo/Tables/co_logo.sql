CREATE TABLE [dbo].[co_logo] (
    [logo_id]       INT           IDENTITY (1, 1) NOT NULL,
    [cono]          INT           NOT NULL,
    [file_name]     VARCHAR (150) NOT NULL,
    [create_date]   DATETIME      CONSTRAINT [DF_co_logo_createdate] DEFAULT (getdate()) NOT NULL,
    [inactive_date] DATE          NULL,
    CONSTRAINT [PK_co_logo] PRIMARY KEY CLUSTERED ([logo_id] ASC) WITH (FILLFACTOR = 90)
);

