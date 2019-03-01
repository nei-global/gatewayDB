

CREATE PROC [dbo].[read_ee_er_online]
    @tid varchar(10) = NULL,
	@er_id int = NULL
AS 
BEGIN 
 
    SELECT	seeo.er_id			as er_id_auto, 
			seeo.expRpt_Nbr		as er_id, 
			seeo.tid, 
			DateSubmitted	as submit_date, 
			Total_Exp		as tot_exp, 
			Total_ReimExp	as tot_reim_exp, 
			--[status],
			comments,
			pymnt			as payment,
			address1,
			address2,
			city,
			[state],
			zip,
			country,
			IsSubmitted as status,--added by SRJ to match current SQL table
			iagree,
			createDate		as create_date,
			lastupdated		as last_updated
    FROM   syn_ee_er_online seeo
	where (seeo.tid = @tid) 
	and  (seeo.er_id = @er_id)

END