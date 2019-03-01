


/*
* 01/04/18 snc: Created
* 02/01/18 snc: Updated
* 03/01/18 jtp: Changed amount calculation to check for zero in currency_exch
*/

CREATE VIEW [dbo].[ee_et_done_ltr_rpt]
AS
SELECT md.tid as tid, 
	md.expense_report as er_id,
	md.er_wksht as item_id,
	md.tdate as tran_date, 	
	md.dsol_desc_long as [description], 
    --md.amt as amount, 
	(md.amt/isnull(NULLIF(vh.currency_exch,0),1)) as amount,
	md.gl as exp_code, 
	md.row_id,
	ec.expense_group as exp_grp,
	--null as currency	
	isnull(vh.currency_from,'USD') as currency
   
FROM dbo.syn_master_detail  md
 INNER JOIN syn_exp_codes ec
  ON md.gl = ec.expense_code 
 Inner Join syn_voucher_his vh
  on md.d_refno = vh.voucher_nbr

Where not(md.er_wksht is null) and md.row_id is not null

/*WHERE     (dbo.master_detail.expense_group IN ('AASST', 'ADISP', 'AO', 'xxx', 'COLA', 'CUL', 'DH', 'EDU', 'FM', 'FURN', 'HF', 'HHG', 'HSB', 'HSG', 'INTL', 'LANG', 
                      'LC', 'LOS', 'MEA', 'MIDA', 'MISC', 'MSUB', 'NHCC', 'OHCC', 'HS', 'PM', 'RELO', 'RF', 'RSUB', 'RT', 'SEA', 'SET', 'LS', 'STRG', 'TL', 'TLATE', 'TXCON', 
                      'TXEQ', 'VISA')) AND (NOT (dbo.master_detail.gl IN ('992', '1010', '2010', '2020', '3010', '3030', '3040', '3041', '7210', '4040', '5010', '5015', '5020', 
                      '5021', '5030', '5040', '5050', '5060', '572', '573', '574', '575', '576', '5061', '5062', '5063', '5210', '6010', '6030', '6031', '4010', '4020', '4025', '4030', 
                      '4031', '4050', '4060', '4065', '4066', '4067', '4080', '4081', '4090', '4100', '4101', '4102', '4103', '4110', '4321', '4120', '4500', '4510', '4520', '4600', 
                      '7100', '7102', '7101', '7111', '7112', '7113', '7105', '490', '527', '528', '529', '530', '531', '532', '533', '534', '535', '536', '802', '804', '899', '905', '989', 
                      '990', '991', '995', '996', '997', '999', '1111', '2020', '2100', '2102', '2103', '2105', '2115', '2200', '2201', '2202', '2203', '2204', '2205', '2210', '2215', 
                      '2900', '4420', '7114', '7500', '7501', '7905', '7910', '7915', '7925', '7930', '8050', '8070', '8071', '8110', '8120', '8810', '8850', '8900', '9013', '9021', 
                      '9022', '9023', '9024', '9025', '9030', '9031', '9040', '9041', '9050', '9060', '9200', '9300', '9310', '9320', '9330', '9340', '9350', '9360', '9370', '9380', 
                      '9390', '9395', '9396', '9397', '9806', '9860', '9861', '9992', '9993', '9994', '9995', '9997', '9998', '9999')))
ORDER BY dbo.TRANSFER_ORBIT.tid, dbo.exp_group.description
*/



