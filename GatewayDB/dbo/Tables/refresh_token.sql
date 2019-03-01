CREATE TABLE [dbo].[refresh_token] (
    [tid]               VARCHAR (10) NOT NULL,
    [token]             VARCHAR (75) NOT NULL,
    [token_expire_date] DATETIME     CONSTRAINT [DF_refresh_token_token_date] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_refresh_token] PRIMARY KEY CLUSTERED ([tid] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the refresh token created in web site and helps to authenticate the refresh token.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'refresh_token';

