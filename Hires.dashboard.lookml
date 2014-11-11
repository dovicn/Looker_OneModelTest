- dashboard: hires
  title: Hires
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: hires_last_30_days
    title: Hires - Last 30 Days
    type: looker_column
    base_view: measures_base
    dimensions: [dim_event_reason.level1desc, dim_event_reason.level2desc, measures_base.todate_date]
    pivots: [dim_event_reason.level2desc, dim_event_reason.level1desc]
    measures: [measures_base.hires]
    filters:
      measures_base.todate_date: 30 days
    sorts: [measures_base.todate_date asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Hires']
    hide_legend: true
    
  - name: hires_last_12_months
    title: Hires - Last 12 Months
    type: looker_column
    base_view: measures_base
    dimensions: [dim_event_reason.level1desc, dim_event_reason.level2desc, measures_base.todate_month]
    pivots: [dim_event_reason.level1desc, dim_event_reason.level2desc]
    measures: [measures_base.hires]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month desc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Hires']
    hide_legend: true
  
  - name: internal_hires
    title: Internal Hires - Last 12 Months
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month, dim_event_reason.level1desc]
    pivots: [dim_event_reason.level1desc]
    measures: [measures_base.internal_movements]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Internal Hires']
    hide_legend: true

  - name: internal_hire_rate
    title: Internal Hire Rate - Last 12 Months
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.internal_movements_rate]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Internal Hire Rate']
    hide_legend: true

  - name: net_hire_ratio
    title: Net Hire Ratio - Last 12 Months
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.net_hire_ratio]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    show_null_labels: false
    stacking: ''
    x_axis_label_rotation: -45
    y_axis_labels: ['Net Hire Ratio']
    hide_legend: true



