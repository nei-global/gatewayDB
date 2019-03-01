CREATE TABLE [dbo].[ee_er_online_log] (
    [er_id]         INT             NOT NULL,
    [expRpt_nbr]    VARCHAR (25)    NULL,
    [TID]           VARCHAR (12)    NULL,
    [DateSubmitted] SMALLDATETIME   NOT NULL,
    [Total_Exp]     DECIMAL (18, 2) NULL,
    [Total_ReimExp] DECIMAL (18, 2) NULL,
    [Status]        INT             NOT NULL,
    [Comments]      TEXT            NULL,
    [pymnt]         VARCHAR (10)    NULL,
    [address1]      VARCHAR (75)    NULL,
    [address2]      VARCHAR (75)    NULL,
    [city]          VARCHAR (50)    NULL,
    [state]         VARCHAR (2)     NULL,
    [zip]           VARCHAR (10)    NULL,
    [country]       VARCHAR (50)    NULL,
    [IsSubmitted]   BIT             NOT NULL,
    [iagree]        VARCHAR (50)    NULL,
    [createDate]    DATETIME        NULL,
    [lastupdated]   DATETIME        NULL,
    [delete_date]   DATETIME        NULL
);

