/*
* 01/02/18 snc: switched to synonym
*/


CREATE VIEW [dbo].[ee_job]
AS
SELECT [tid]						as tid
      ,[candidate_type]				as cand_type
      ,[employment_offered]			as empl_offer
      ,[employment_accepted]		as empl_acpt
      ,[employment_declined]		as empl_decl
      ,[employment_decline_reason]	as empl_decl_reason
      ,[len_assign]					as len_assign
      ,[years_employed]				as years_empl
      ,[emp_id]						as emp_id
      ,[termination_date]			as term_date
      ,[sarbannes_oxley]			as sarbannes_oxley
      ,[move_reason]				as move_reason
      ,[move_reason_desc]			as move_reason_desc
      ,[effective_date]				as effect_date
      ,[job_start_date]				as job_start_date
      ,[job_user1]					as job_user1
      ,[job_user2]					as job_user2
      ,[job_user3]					as job_user3
      ,[job_user4]					as job_user4
      ,[to_area]					as to_area
      ,[to_co]						as to_co
      ,[to_div]						as to_div
      ,[tjob_desc]					as to_job_desc
      ,[tlevel_desc]				as to_level_desc
      ,[tloc_desc]					as to_loc_desc
      ,[to_bus_unit]				as to_bus_unit
      ,[to_dept]					as to_dept
      ,[to_funct]					as to_func
      ,[to_fund]					as to_fund
      ,[to_job]						as to_job
      ,[to_level]					as to_level
      ,[to_location]				as to_loc
      ,[to_payroll]					as to_payroll
      ,[to_plant]					as to_plant
      ,[to_response]				as to_response
      ,[tpayroll_desc]				as to_payroll_desc
      ,[tplant_desc]				as to_plant_desc
      ,[tresponse_desc]				as to_response_desc
      ,[tfunct_desc]				as to_func_desc
      ,[tfund_desc]					as to_fund_desc
      ,[tco_desc]					as to_co_desc
      ,[tbus_unit_desc]				as to_bus_unit_desc
      ,[tdept_desc]					as to_dept_desc
      ,[tdiv_desc]					as to_div_desc
      ,[tarea_desc]					as to_area_desc
      ,[file_started_by]			as file_start_by
      ,[file_started_by_desc]		as file_start_by_desc
      ,[billing_contact]			as bill_contact
      ,[billing_contact_name]		as bill_contact_desc
      ,[to_job_second_char]			as to_job_sec_char
      ,[up_relo_effect_date]		as up_relo_effect_date
      ,[job_user1_YN]				as job_user1_flag
      ,[job_user2_YN]				as job_user2_flag
      ,[job_user3_YN]				as job_user3_flag
      ,[job_user4_YN]				as job_user4_flag
      ,[candidate_move_auth]		as cand_move_auth
      ,[candidate_contact_date]		as cand_contact_date
      ,[assign_end_date]			as assign_end_date
      ,[to_funct_date]				as to_func_date
      ,[pe_org_id]					as pe_org_id
      ,[job_info1]					as job_info1
      ,[job_info1_desc]				as job_info1_desc
      ,[actual_assign_end_date]		as actual_assign_end_date
      ,[home_payroll]				as home_payroll
      ,[home_payroll_desc]			as home_payroll_desc
      ,[host_payroll]				as host_payroll
      ,[host_payroll_desc]			as host_payroll_desc
      ,[ext_length_last]			as ext_length_last
      ,[sch_ext_end_date_last]		as sch_ext_end_date_last
      ,[home_country]				as home_country
      ,[host_country]				as host_country
      ,[assignment_type]			as assign_type
      ,[dns_update]					as dns_update
      ,[sch_job_start_date]			as sch_job_start_date
      ,[job_user5]					as job_user5
      ,[job_user6]					as job_user6
      ,[job_user7]					as job_user7
      ,[job_user8]					as job_user8
      ,[job_info5]					as job_info5
      ,[job_info5_desc]				as job_info5_desc
      ,[first_assign]				as first_assign
      ,[home_country_desc]			as home_country_desc
      ,[host_country_desc]			as host_country_desc
      ,[job_info2]					as job_info2
      ,[job_info2_desc]				as job_info2_desc
      ,[job_info3]					as job_info3
      ,[job_info3_desc]				as job_info3_desc
      ,[job_info4]					as job_info4
      ,[job_info4_desc]				as job_info4_desc
      ,[job_info6]					as job_info6
      ,[job_info6_desc]				as job_info6_desc
      ,[job_info7]					as job_info7
      ,[job_info7_desc]				as job_info7_desc
      ,[job_info8]					as job_info8
      ,[job_info8_desc]				as job_info8_desc
      ,[job_info9]					as job_info9
      ,[job_info9_desc]				as job_info9_desc
      ,[job_info10]					as job_info10
      ,[job_info10_desc]			as job_info10_desc
      ,[job_info11]					as job_info11
      ,[job_info11_desc]			as job_info11_desc
      ,[job_info12]					as job_info12
      ,[job_info12_desc]			as job_info12_desc
      ,[job_info13]					as job_info13
      ,[job_info13_desc]			as job_info13_desc
      ,[job_info14]					as job_info14
      ,[job_info14_desc]			as job_info14_desc
      ,[job_info15]					as job_info15
      ,[job_info15_desc]			as job_inf15_desc
      ,[job_info16]					as job_info16
      ,[job_info16_desc]			as job_info16_desc
      ,[job_info17]					as job_info17
      ,[job_info17_desc]			as job_info17_desc
      ,[job_info18]					as job_info18
      ,[job_info18_desc]			as job_info18_desc
      ,[job_info19]					as job_info19
      ,[job_info19_desc]			as job_info19_desc
      ,[job_info20]					as job_info20
      ,[job_info20_desc]			as job_info20_desc
      ,[job_info21]					as job_info21
      ,[job_info21_desc]			as job_info21_desc
      ,[job_info22]					as job_info22
      ,[job_info22_desc]			as job_info22_desc
      ,[ssn_filled]					as ssn_fill
      ,[job_user1_date]				as job_user1_date
      ,[job_user2_date]				as job_user2_date
      ,[job_user3_date]				as job_user3_date
      ,[job_user4_date]				as job_user4_date
      ,[employee_type]				as emp_type
      ,[job_title]					as job_title
      ,[assignment_type_desc]		as assign_type_desc
      ,[employee_type_desc]			as emp_type_desc
      ,[exec_level_move]			as exec_level_move
      ,[salary]						as salary
      ,[salary_currency]			as salary_currency
      ,[salary_factor]				as salary_factor
      ,[auth_originator]			as auth_originator
      ,[auth_approver]				as auth_approver
      ,[client_move_type]			as co_move_type
      ,[benefit_pkg_expire_date]	as bene_pkg_expire_date
      ,[miles_new]					as mile_new
      ,[units_new]					as unit_new
      ,[miles_old]					as mile_old
      ,[units_old]					as unit_old
      ,[transition_date]			as tran_date
FROM  syn_JOB_RELATED




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ee_job"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ee_job';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ee_job';

