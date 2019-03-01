
-- =============================================
-- Author:		John Tatum
-- Create date: 9/27/2018
-- Description:	Holds a client specific message to be displayed on login
-- =============================================



CREATE view [dbo].[co_login_note]
as 

SELECT [co_login_note_id]
	  ,[cono]
      ,[NEI_site]
      ,[title]
      ,[note_desc]
      ,[note_start_date]
      ,[note_end_date]
      ,[inactive]
 FROM [syn_co_login_note] 









