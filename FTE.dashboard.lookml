- dashboard: fte
  title: Fte
  layout: tile
  tile_size: 100


  filters:
  
  - name: date
    title: "Created Date"
    type: date_filter
    default_value: last 12 months


  elements:

  - name: fte_measure
    title: Full Time Equivelent
    type: looker_column
    base_view: view_employee_timeperiods_day_denormal
    dimensions: [view_employee_timeperiods_day_denormal.todate_month, dim_gender.level1desc]
    pivots: [dim_gender.level1desc]
    measures: [view_employee_timeperiods_day_denormal.full_time_equivlent]
    listen:
      date: view_employee_timeperiods_day_denormal.todate_date
    sorts: [view_employee_timeperiods_day_denormal.todate_month asc]
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['FTE']
    limit: 500
