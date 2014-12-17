- dashboard: demographics
  title: Demographics
  layout: tile
  tile_size: 100
  show_applied_filters: false
  

  filters:
  - name: department_lvl_2
    title: "Department Level 2"
    type: suggest_filter
    base_view: dim_org_unit
    dimension: dim_org_unit.level2desc
    
  - name: country
    title: "Country"
    type: suggest_filter
    base_view: dim_country
    dimension: dim_country.level1desc

  elements:

  - name: current_headcount
    title: Headcount - Today
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.headcount_daily]
    filters:
      measures_employee_daily.todate_date: today
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.headcount_daily desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
  
  - name: average_age_daily
    title: Average Age - Today
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.average_age_daily]
    filters:
      measures_employee_daily.todate_date: today
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.average_age_daily desc]
    limit: 500
    show_null_labels: false
    width: 2
    height: 2
    
  - name: average_tenure_daily
    title: Average Tenure (Years) - Today
    type: single_value
    base_view: measures_employee_daily
    measures: [measures_employee_daily.average_tenure_daily]
    filters:
      measures_employee_daily.todate_date: today
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.average_tenure_daily desc]
    limit: 500
    show_null_labels: false
    width: 2
    height: 2
    
  - name: gender_diversity_ratio
    title: Gender Diversity Ratio
    type: looker_pie
    base_view: measures_employee_daily
    dimensions: [dim_gender.level1desc]
    measures: [measures_employee_daily.headcount_daily]
    filters:
      measures_employee_daily.todate_date: today
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.headcount_daily desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2

  - name: full_part_time_ratio
    title: Full vs Part Time
    type: looker_pie
    base_view: measures_employee_daily
    dimensions: [measures_employee_daily.fullpart]
    measures: [measures_employee_daily.headcount_daily]
    filters:
      measures_employee_daily.todate_date: today
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.headcount_daily desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2

  - name: hc_department_lv2
    title: Headcount - Today by Department
    type: looker_donut_multiples
    base_view: measures_employee_daily
    dimensions: [dim_org_unit.level2desc, measures_employee_daily.todate_date]
    pivots: [dim_org_unit.level2desc]
    measures: [measures_employee_daily.headcount_daily]
    filters:
      measures_employee_daily.todate_date: today
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.headcount_daily desc]
    width: 6
    height: 4
    
  - name: add_a_unique_name_46
    title: End of Month Headcount
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.end_of_month_headcount]
    filters:
      measures_base.todate_date: 12 months
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: ''
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['End of Month Headcount']
    hide_legend: true
    width: 7
    height: 4

  - name: staffing_rate_approaching_retirement_eligibility
    title: Staffing Rate - Approaching Retirement Eligibility
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.staffing_rate_approaching_retirement_eligiblity]
    filters:
      measures_base.todate_date: 12 months
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
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
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.headcount_daily desc]
    limit: 500
    show_null_labels: false
    quantize_colors: false
    map: world
    map_projection: ''
    colors: [lightgray, blue, green]
    loading: false
    width: 8
    height: 5
