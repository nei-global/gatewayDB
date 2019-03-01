
-- Author:		Sushil Joshi
-- Create date: 10/26/2017
-- Description:	Insert fileName in co_logo table for given cono.If file with same name exists in cono then alter the name of file befor inserting
--						
-- =============================================
Create PROCEDURE [dbo].[insert_co_logo_fileName] 
	-- Add the parameters for the stored procedure here
	@cono int,
	@fileName varchar(10)
AS

Begin

IF EXISTS ( select top 1 cono from co_logo where cono=@cono and file_name=@fileName)
Begin
Declare @newFileName varchar
set @newFileName = SUBSTRING(@fileName, 0, charindex('.', @fileName, 0))+'_new'+RIGHT(@fileName,CHARINDEX('.', REVERSE(@fileName))-1)
  
 insert into co_logo values (@cono,@newFileName,getdate(),null)
End
Else
Begin

 insert into co_logo values (@cono,@fileName,getdate(),null)
End

End

