- dashboard: employee_event_anniversaries
  title: Employee Event Anniversaries
  layout: tile
  tile_size: 100

  filters:
  - name: date
    title: "Event Date"
    type: date_filter
    default_value: this week
    
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

  
    
  - name: birthdays_year
    title: Birthdays and Hire Anniversaries by Month
    type: looker_column
    base_view: measures_employee_daily
    dimensions: [measures_employee_daily.todate_month]
    measures: [measures_employee_daily.birthdays_total, measures_employee_daily.hire_anniversaries]
    filters:
      measures_employee_daily.todate_date: this year
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
    sorts: [measures_employee_daily.todate_month]
    limit: 500
    show_null_labels: false
    colors: [lightgreen,olive]
    stacking: ''
    x_axis_label_rotation: -45
    y_axis_labels: ['Birthdays and Hire Anniversaries This Year']
    y_axis_combined: true
    hide_legend: true
    width: 10
    height: 4
 
  - name: birthdays_week
    title: Birthdays in Selected Period
    type: looker_column
    base_view: measures_employee_daily
    dimensions: [measures_employee_daily.todate_date]
    measures: [measures_employee_daily.birthdays_total]
    filters:
      measures_employee_daily.todate_date: this week
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
      date: measures_employee_daily.todate_date
    sorts: [measures_employee_daily.todate_date]
    limit: 500
    show_null_labels: false
    colors: [lightgreen]
    stacking: ''
    x_axis_label_rotation: -45
    y_axis_labels: ['Birthdays in Selected Period']
    hide_legend: true
    width: 5
    height: 4
   
  - name: birthday_period_table
    title: People with Birthdays in Selected Period
    type: table
    base_view: measures_employee_daily
    dimensions: [measures_employee_daily.todate_date, measures_employee_daily.firstname,
      measures_employee_daily.lastname]
    filters:
      measures_employee_daily.todate_date: this week
      measures_employee_daily.birthday_count: '1'
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
      date: measures_employee_daily.todate_date
    sorts: [measures_employee_daily.todate_date desc]
    limit: 500
    width: 5
    
  - name: hire_anniversary_week
    title: Hire Anniversaries in Selected Period
    type: looker_column
    base_view: measures_employee_daily
    dimensions: [measures_employee_daily.todate_date]
    measures: [measures_employee_daily.hire_anniversaries]
    filters:
      measures_employee_daily.todate_date: this week
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
      date: measures_employee_daily.todate_date
    sorts: [measures_employee_daily.todate_date desc]
    limit: 500
    show_null_labels: false
    colors: [olive]
    stacking: ''
    x_axis_label_rotation: -45
    y_axis_labels: ['Hire Anniversaries in Selected Period']
    width: 5
    height: 4
    
    
  - name: hire_anniversary_period_table
    title: People with Hire Anniversaries in Selected Period
    type: table
    base_view: measures_employee_daily
    dimensions: [measures_employee_daily.todate_date, measures_employee_daily.firstname,
      measures_employee_daily.lastname]
    measures: [measures_employee_daily.average_tenure_daily]
    filters:
      measures_employee_daily.todate_date: this week
      measures_employee_daily.hire_anniversaries: '1'
    listen:
      department_lvl_2: dim_org_unit.level2desc
      country: dim_country.level1desc
      date: measures_employee_daily.todate_date
    sorts: [measures_employee_daily.todate_date desc]
    limit: 500
    width: 5

    

