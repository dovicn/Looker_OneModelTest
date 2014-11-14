- dashboard: movements
  title: Movements
  layout: tile
  tile_size: 100

  filters:
  
  - name: date
    title: "Created Date"
    type: date_filter
    default_value: last 12 months

  elements:
  
  - name: upward_mobility
    title: Upward Mobility
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.upward_mobility]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Upward Mobility']
    hide_legend: true
  
  - name: lateral_mobility
    title: Lateral Mobility
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.lateral_mobility]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Lateral Mobility']
    hide_legend: true
  
  - name: transfers
    title: Transfers
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month, dim_event_reason.level2desc]
    pivots: [dim_event_reason.level2desc]
    measures: [measures_base.transfers]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Transfers']
    hide_legend: true
    
  - name: transfer_rate
    title: Transfer Rate
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.transfer_rate]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Transfer Rate']
    hide_legend: true
    
  - name: promotions
    title: Promotions
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month, dim_event_reason.level2desc]
    pivots: [dim_event_reason.level2desc]
    measures: [measures_base.promotions]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Promotions']
    hide_legend: true
    
  - name: promotion_rate
    title: Promotion Rate
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.promotion_rate]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Promotion Rate']
    hide_legend: true
    
  - name: demotions
    title: Demotions
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month, dim_event_reason.level2desc]
    pivots: [dim_event_reason.level2desc]
    measures: [measures_base.demotions]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Demotions']
    hide_legend: true
    
  - name: demotion_rate
    title: Demotion Rate
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.demotion_rate]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Demotion Rate']
    hide_legend: true
    
  