CREATE TABLE [dbo].[client_logo] (
    [logo_id]       INT           IDENTITY (1, 1) NOT NULL,
    [cono]          VARCHAR (10)  NOT NULL,
    [file_name]     VARCHAR (96)  NULL,
    [date_added]    SMALLDATETIME CONSTRAINT [DF_client_logo_dateadded] DEFAULT (getdate()) NOT NULL,
    [inactive_date] SMALLDATETIME NULL,
    CONSTRAINT [PK_client_logo] PRIMARY KEY CLUSTERED ([logo_id] ASC) WITH (FILLFACTOR = 90)
);

