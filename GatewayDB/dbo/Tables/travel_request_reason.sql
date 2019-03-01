CREATE TABLE [dbo].[travel_request_reason] (
    [code]   VARCHAR (2)  NOT NULL,
    [reason] VARCHAR (30) NULL,
    CONSTRAINT [PK_travel_request_reason] PRIMARY KEY CLUSTERED ([code] ASC)
);

