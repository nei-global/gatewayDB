CREATE TABLE [dbo].[travel_request_member] (
    [id]                INT           IDENTITY (1, 1) NOT NULL,
    [travel_request_id] INT           NOT NULL,
    [member_name]       VARCHAR (100) NULL,
    [relationship_code] VARCHAR (2)   NULL,
    CONSTRAINT [PK__travel_request_member] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK__travel_request_id] FOREIGN KEY ([travel_request_id]) REFERENCES [dbo].[travel_request] ([id])
);

