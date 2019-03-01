

/*
* 01/04/17 snc: Created
*/

CREATE VIEW [dbo].[ee_et_done_ltr]
AS
SELECT  e.tid, 
		p.oth_et_done_sent as sent_date, 
		p.oth_et_done_how_sent as how_sent, 
        e.done_ltr_requested as rqst_date, 
		e.done_ltr_requested_by as rqst_by, 
		e.done_ltr_requested_how as rqst_how, 
		e.et_email_addr as email
FROM syn_et_done_letter e
	LEFT OUTER JOIN syn_papertrail_et p
	ON e.tid = p.tid


