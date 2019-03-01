
-- =============================================
-- Author:		Meredith Alder
-- Create date: 2/26/2019
-- Description:	US 9823 Return the navigation sections and subsections
-- =============================================
CREATE PROCEDURE [dbo].[get_gg_nav_2]
AS
BEGIN

select 
		gn.nav_id as NavId, 
		gn.user_type as UserType,
		gn.title as Title,
		gn.url as NavUrl,
		gn.icon as Icon,
		gn.desciption as NavDescription,
		gn.new_window as IsNewWindow,
		gn.ordinal as Ordinal,
		gn.title_key as TitleKey,
		gn.inactive as InActive,
		GgNavSub =
			replace((select gns.nav_sub_id as NavSubId,
				gns.nav_id as NavId, 
				gns.title as Title,
				replace(gns.url,'/','||') as NavUrl,
				gns.description as NavDescription,
				gns.new_window as IsNewWindow,
				gns.ordinal as Ordinal,
				gns.title_key as TitleKey,
				gns.inactive as InActive
			from gg_nav_sub as gns
			where gn.nav_id = gns.nav_id
				and gns.inactive = 0
			order by gns.ordinal
			for json path), '||', '/')
	from gg_nav as gn
	where gn.inactive = 0
	order by gn.ordinal

END
