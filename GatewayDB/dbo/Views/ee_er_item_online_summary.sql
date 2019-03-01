




CREATE VIEW [dbo].[ee_er_item_online_summary]
AS
/*
12/19/17  snc  created
*/

select
ee_er_online.tid
,ee_er_online.er_id
,sum(ee_er_item_online.amount) as sum_amt
,ee_er_item_online.currency
from ee_er_online
inner join ee_er_item_online
	on ee_er_online.er_id_auto = ee_er_item_online.er_id_auto

group by ee_er_online.tid, ee_er_online.er_id, ee_er_item_online.currency



