CREATE TABLE [dbo].[travel_request] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [tid]          VARCHAR (10)  NULL,
    [trip_no]      INT           NULL,
    [email]        VARCHAR (75)  NULL,
    [out_phone]    VARCHAR (25)  NULL,
    [travel_phone] VARCHAR (25)  NULL,
    [reason_code]  VARCHAR (2)   NULL,
    [car]          BIT           NULL,
    [hotel]        BIT           NULL,
    [comments]     VARCHAR (MAX) NULL,
    [create_date]  DATETIME      NULL,
    [update_date]  DATETIME      NULL,
    CONSTRAINT [PK_travel_request] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_travel_request_trip]
    ON [dbo].[travel_request]([tid] ASC, [trip_no] ASC);

