





CREATE VIEW [dbo].[ee_contact]
AS

/* 
* 11/27/18 mkb: created
* 1/17/19 mla: US 9012 - the labels are no longer needed (cont_desc) which is now commented out
* 1/29/19 mla: Bug 9743 - user changes on the Account Information page do not appear until a manual step is completed
*/
SELECT 
	eecontacts.tid,
	eecontacts.cont_type,
	--cont_desc,
	--eecontacts.cont_info,
	(CASE	
			WHEN eecontacts.cont_type = 'PHONE' AND LEN(REPLACE(eecontacts.cont_info,'.','')) = 10
			THEN  '(' + LEFT(REPLACE(eecontacts.cont_info,'.',''), 3) + ') ' + SUBSTRING(REPLACE(eecontacts.cont_info,'.',''), 4, 3) + '-' + SUBSTRING(REPLACE(eecontacts.cont_info,'.',''), 7, 4)

			ELSE eecontacts.cont_info

	END) AS cont_info

FROM (
--orig home 
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'HOME PHONE' AS cont_desc,
		td.home_phone AS cont_info
	FROM syn_transfer_data td

--orig ee work 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'WORK PHONE' AS cont_desc,
		td.office_phone AS cont_info
	FROM syn_transfer_data td

--orig ee work cell
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'WORK CELL PHONE' AS cont_desc,
		td.old_work_cell AS cont_info
	FROM syn_transfer_data td

---orig ee cell 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'CELL PHONE' AS cont_desc,
		td.old_cell AS cont_info
	FROM syn_transfer_data td

--orig so work 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'SPOUSE WORK PHONE' AS cont_desc,
		td.so_old_work_phone AS cont_info
	FROM syn_transfer_data td

--orig so work cell
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'SPOUSE WORK CELL PHONE' AS cont_desc,
		td.so_old_work_cell AS cont_info
	FROM syn_transfer_data td

---orig so cell 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'SPOUSE CELL PHONE' AS cont_desc,
		td.so_old_cell AS cont_info
	FROM syn_transfer_data td


---dest home 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'NEW HOME PHONE' AS cont_desc,
		td.new_home_phone AS cont_info
	FROM syn_transfer_data td

---dest ee work 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'NEW WORK PHONE' AS cont_desc,
		td.new_phone AS cont_info
	FROM syn_transfer_data td

--dest ee work cell
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'NEW WORK CELL PHONE' AS cont_desc,
		td.new_work_cell AS cont_info
	FROM syn_transfer_data td

--dest ee cell
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'NEW CELL PHONE' AS cont_desc,
		td.new_cell AS cont_info
	FROM syn_transfer_data td

--dest so work 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'SPOUSE NEW WORK PHONE' AS cont_desc,
		td.so_new_work_phone AS cont_info
	FROM syn_transfer_data td

--orig so work cell
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'SPOUSE NEW WORK CELL PHONE' AS cont_desc,
		td.so_new_work_cell AS cont_info
	FROM syn_transfer_data td

---orig so cell 
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
--		'SPOUSE NEW CELL PHONE' AS cont_desc,
		td.so_new_cell AS cont_info
	FROM syn_transfer_data td

---home email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'HOME EMAIL' AS cont_desc,
		td.old_home_email AS cont_info
	FROM syn_transfer_data td

---work email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'WORK EMAIL' AS cont_desc,
		td.old_work_email AS cont_info
	FROM syn_transfer_data td

---sp home email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'SPOUSE HOME EMAIL' AS cont_desc,
		td.so_old_home_email AS cont_info
	FROM syn_transfer_data td

---sp work email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'SPOUSE WORK EMAIL' AS cont_desc,
		td.so_old_work_email AS cont_info
	FROM syn_transfer_data td

---new home email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'NEW HOME EMAIL' AS cont_desc,
		td.new_home_email AS cont_info
	FROM syn_transfer_data td

---new work email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'NEW WORK EMAIL' AS cont_desc,
		td.ee_email_add AS cont_info
	FROM syn_transfer_data td

---new sp home email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'SPOUSE NEW HOME EMAIL' AS cont_desc,
		td.so_new_home_email AS cont_info
	FROM syn_transfer_data td

---new sp work email 
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
--		'SPOUSE NEW WORK EMAIL' AS cont_desc,
		td.so_new_home_email AS cont_info
	FROM syn_transfer_data td

-- phone info from account information page (NEI_WEBSITE.dbo.transfer_login)
UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
		tl.new_home_phone AS cont_info
	FROM syn_transfer_login tl

UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
		tl.new_phone AS cont_info
	FROM syn_transfer_login tl

UNION all	
	SELECT	
		tid AS tid,
		'PHONE' as cont_type,
		tl.cell_phone AS cont_info
	FROM syn_transfer_login tl

-- email info from account information page (NEI_WEBSITE.dbo.transfer_login)
UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
		tl.new_home_email AS cont_info
	FROM syn_transfer_login tl

UNION all	
	SELECT	
		tid AS tid,
		'EMAIL' as cont_type,
		tl.ee_email_add AS cont_info
	FROM syn_transfer_login tl

) eecontacts

WHERE cont_info is not null


