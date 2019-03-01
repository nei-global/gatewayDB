


CREATE VIEW [dbo].[transfer_old_home]

AS
SELECT        TRANSFER_OLD_HOME_1.tid, TRANSFER_OLD_HOME_1.old_address, TRANSFER_OLD_HOME_1.old_city, TRANSFER_OLD_HOME_1.old_state, 
                         TRANSFER_OLD_HOME_1.old_zip, TRANSFER_OLD_HOME_1.old_country, TRANSFER_OLD_HOME_1.city_state_zip, TRANSFER_OLD_HOME_1.home_phone, 
                         TRANSFER_OLD_HOME_1.hma_expiration, TRANSFER_OLD_HOME_1.prior_status, TRANSFER_OLD_HOME_1.prior_status_desc, 
                         TRANSFER_OLD_HOME_1.orig_purchase_date, TRANSFER_OLD_HOME_1.orig_purchase_price, TRANSFER_OLD_HOME_1.purchase_date, 
                         TRANSFER_OLD_HOME_1.possession_date, TRANSFER_OLD_HOME_1.aclose, TRANSFER_OLD_HOME_1.qclose, TRANSFER_OLD_HOME_1.accept_amt, 
                         TRANSFER_OLD_HOME_1.sched_buyout_date, TRANSFER_OLD_HOME_1.gross_sale_price, TRANSFER_OLD_HOME_1.fm_offer_amt, 
                         TRANSFER_OLD_HOME_1.offer_accepted, TRANSFER_OLD_HOME_1.offer_date, TRANSFER_OLD_HOME_1.offer_expires, TRANSFER_OLD_HOME_1.cur_list_amt, 
                         TRANSFER_OLD_HOME_1.cur_list_exp, TRANSFER_OLD_HOME_1.cur_list_cont, TRANSFER_OLD_HOME_1.cur_list_phone, 
                         TRANSFER_OLD_HOME_1.current_broker_email, TRANSFER_OLD_HOME_1.current_broker_name, TRANSFER_OLD_HOME_1.est_value, 
                         TRANSFER_OLD_HOME_1.offer_date_cur, TRANSFER_OLD_HOME_1.offer_accpt_amt, TRANSFER_OLD_HOME_1.appr_offer_amt, 
                         TRANSFER_OLD_HOME_1.el_last_broker_nbr, TRANSFER_OLD_HOME_1.buyout_offer_sent, TRANSFER_OLD_HOME_1.offer_amount, 
                         TRANSFER_OLD_HOME_1.avs_offer_amt, TRANSFER_OLD_HOME_1.direct_reimb_sch_close, TRANSFER_OLD_HOME_1.direct_reimb_actual_close, 
                         TRANSFER_OLD_HOME_1.direct_reimb_actual_sales_price, TRANSFER_OLD_HOME_2.old_home_email, 
                         TRANSFER_OLD_HOME_2.old_work_email, TRANSFER_OLD_HOME_2.hs_end_date
FROM					AG_Listener_Test.ORBIT_DATA.dbo.TRANSFER_OLD_HOME AS TRANSFER_OLD_HOME_1 LEFT OUTER JOIN
                         AG_Listener_Test.ORBIT_DATA.dbo.TRANSFER_OLD_HOME_2 as TRANSFER_OLD_HOME_2 ON TRANSFER_OLD_HOME_1.tid = TRANSFER_OLD_HOME_2.tid

