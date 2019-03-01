
CREATE FUNCTION [dbo].[get_CONO] (@tid varchar(10))
    RETURNS varchar(10)
AS
begin
  declare @cono varchar(10)
  set @cono = substring(@tid,1,charindex('-',@tid)-1) 
--  set @cono = left(@tid,charindex('-',@tid,0)-1) 

  return @cono
end
