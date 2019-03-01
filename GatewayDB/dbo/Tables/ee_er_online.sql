CREATE TABLE [dbo].[ee_er_online] (
    [er_id_auto]   INT             IDENTITY (1, 1) NOT NULL,
    [er_id]        AS              ('W-'+CONVERT([varchar](10),[er_id_auto])),
    [tid]          VARCHAR (10)    NULL,
    [submit_date]  DATE            CONSTRAINT [DF_ee_er_online_date_submitted] DEFAULT (getdate()) NOT NULL,
    [tot_exp]      DECIMAL (18, 2) NULL,
    [tot_reim_exp] DECIMAL (18, 2) NULL,
    [status]       BIT             NULL,
    [comments]     VARCHAR (MAX)   NULL,
    [payment]      VARCHAR (10)    NULL,
    [address1]     VARCHAR (75)    NULL,
    [address2]     VARCHAR (75)    NULL,
    [city]         VARCHAR (50)    NULL,
    [state]        VARCHAR (2)     NULL,
    [zip]          VARCHAR (10)    NULL,
    [country]      VARCHAR (50)    NULL,
    [iagree]       VARCHAR (50)    NULL,
    [create_date]  DATETIME        CONSTRAINT [DF_ee_er_online_create_date] DEFAULT (getdate()) NOT NULL,
    [last_updated] DATETIME        CONSTRAINT [DF_ee_er_online_last_updated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ee_er_online] PRIMARY KEY CLUSTERED ([er_id_auto] ASC)
);

