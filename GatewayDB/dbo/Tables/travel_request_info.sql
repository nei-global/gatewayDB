CREATE TABLE [dbo].[travel_request_info] (
    [id]                INT          IDENTITY (1, 1) NOT NULL,
    [travel_request_id] INT          NOT NULL,
    [tid]               VARCHAR (10) NULL,
    [trip_no]           INT          NULL,
    [travel_type]       VARCHAR (3)  NULL,
    [from_date]         DATE         NULL,
    [from_iata]         VARCHAR (50) NULL,
    [from_city]         VARCHAR (50) NULL,
    [from_state]        VARCHAR (50) NULL,
    [from_country]      VARCHAR (50) NULL,
    [arrival_time]      TIME (7)     NULL,
    [arrival_meridiem]  VARCHAR (2)  NULL,
    [to_date]           DATE         NULL,
    [to_iata]           VARCHAR (50) NULL,
    [to_city]           VARCHAR (50) NULL,
    [to_state]          VARCHAR (50) NULL,
    [to_country]        VARCHAR (50) NULL,
    CONSTRAINT [PK_travel_request_info] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK__travel_request_gen_id] FOREIGN KEY ([travel_request_id]) REFERENCES [dbo].[travel_request] ([id])
);

