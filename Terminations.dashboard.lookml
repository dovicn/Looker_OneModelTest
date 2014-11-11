- dashboard: terminations
  title: Terminations
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: terminations
    title: Terminations - Last 30 days
    type: looker_column
    base_view: measures_base
    dimensions: [dim_event_reason.level1desc, measures_base.todate_date]
    pivots: [dim_event_reason.level1desc]
    measures: [measures_base.terminations]
    filters:
      measures_base.todate_date: 30 days
    sorts: [measures_base.todate_date asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Terminations']
    hide_legend: true
    
  - name: volunatary_terminations
    title: Volunatry Terminations - Last 12 Months
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month, dim_event_reason.level2desc]
    pivots: [dim_event_reason.level2desc]
    measures: [measures_base.terminations]
    filters:
      dim_event_reason.level1desc: '"Voluntary Termination"'
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Terminations']
    hide_legend: true
