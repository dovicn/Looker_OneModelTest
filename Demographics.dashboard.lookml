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
  
  - name: add_a_unique_name_46
    title: End of Month Headcount
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.end_of_month_headcount]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: ''
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['End of Month Headcount']
    hide_legend: true
    width: 8
    height: 4

  - name: staffing_rate_approaching_retirement_eligibility
    title: Staffing Rate - Approaching Retirement Eligibility
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.staffing_rate_approaching_retirement_eligiblity]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    show_null_labels: false
    show_null_points: false
    stacking: ''
    x_axis_label_rotation: -45
    y_axis_labels: ['Staffing Rate']
    hide_legend: true
    width: 8
    height: 4


  - name: world_headcount_map
    title: Headcount - Today
    type: looker_geo_choropleth
    base_view: measures_employee_daily
    dimensions: [dim_country.level1desc]
    measures: [measures_employee_daily.headcount_daily]
    filters:
      measures_employee_daily.todate_date: today
    sorts: [measures_employee_daily.headcount_daily desc]
    limit: 500
    show_null_labels: false
    quantize_colors: false
    map: world
    map_projection: ''
    colors: []
    loading: false
    width: 8
    height: 5
