CREATE TABLE [dbo].[Filter_Type] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [FilterBy]   VARCHAR (5)   NULL,
    [Type]       VARCHAR (10)  NULL,
    [FilterName] VARCHAR (MAX) NULL
);

