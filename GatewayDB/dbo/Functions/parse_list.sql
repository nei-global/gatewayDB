/*
* 11/02/18 mla: created
*/

CREATE function [dbo].[parse_list]
(@list as varchar(500),
 @delim as char(1))
returns @table table 
(
	item_id int identity(1,1), item_value varchar(100)
)
as 
begin

	declare @delim_loc int

	set @delim_loc = charindex(@delim, @list)

	if (@delim_loc = 0 and len(@list) > 0)
		insert into @table(item_value) values(@list)

	while (@delim_loc > 0)
	begin
		insert into @table(item_value) values(ltrim(rtrim(substring(@list, 1, @delim_loc - 1))))

		set @list = substring(@list, @delim_loc + 1, 1000)

		set @delim_loc = charindex(@delim, @list)

		if (@delim_loc = 0 and len(@list) > 0)
			insert into @table(item_value) values(ltrim(rtrim(@list)))

	end

	return 
	
end

