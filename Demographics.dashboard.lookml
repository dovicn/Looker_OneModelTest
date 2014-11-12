- dashboard: demographics
  title: Demographics
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: current_headcount
    title: Headcount - Today
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.headcount_daily]
    filters:
      measures_employee_daily.todate_date: today
    sorts: [measures_employee_daily.headcount_daily desc]
    limit: 500
    show_null_labels: false
    width: 4
    height: 2

  - name: average_age_daily
    title: Average Age - Today
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.average_age_daily]
    filters:
      measures_employee_daily.todate_date: today
    sorts: [measures_employee_daily.average_age_daily desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
    
  - name: average_tenure_daily
    title: Average Tenure (Years) - Today
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.average_tenure_daily]
    filters:
      measures_employee_daily.todate_date: today
    sorts: [measures_employee_daily.average_tenure_daily desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
    
  - name: staffing_rate_female
    title: Female Staffing Rate
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.staffing_rate_female]
    filters:
      measures_employee_daily.todate_date: today
    sorts: [measures_employee_daily.staffing_rate_female desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
    
  - name: staffing_rate_male
    title: Male Staffing Rate
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.staffing_rate_male]
    filters:
      measures_employee_daily.todate_date: today
    sorts: [measures_employee_daily.staffing_rate_male desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
