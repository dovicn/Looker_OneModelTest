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
  
  - name: hiress_over_time
    title: Hires
    type: looker_column
    base_view: view_employee_event_denormal
    dimensions: [dim_event_reason.level1desc, view_employee_event_denormal.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [view_employee_event_denormal.hires]
    listen:
      date: view_employee_event_denormal.effdt_date
    sorts: [view_employee_event_denormal.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Hires']

  - name: terminations_over_time
    title: Terminations
    type: looker_column
    base_view: view_employee_event_denormal
    dimensions: [dim_event_reason.level1desc, view_employee_event_denormal.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [view_employee_event_denormal.terminations]
    listen:
      date: view_employee_event_denormal.effdt_date
    sorts: [view_employee_event_denormal.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Terminations']

  - name: movements_over_time
    title: Movements
    type: looker_column
    base_view: view_employee_event_denormal
    dimensions: [dim_event_reason.level1desc, view_employee_event_denormal.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [view_employee_event_denormal.movements]
    listen:
      date: view_employee_event_denormal.effdt_date
    sorts: [view_employee_event_denormal.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Movements']

  - name: internal_movements_over_time
    title: Internal Movements
    type: looker_column
    base_view: view_employee_event_denormal
    dimensions: [dim_event_reason.level1desc, view_employee_event_denormal.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [view_employee_event_denormal.movements]
    filters:
      dim_event_reason.level1desc: -"Hire", -"Voluntary Termination", -"Involuntary Termination", -"Other Terminations"
    listen:
      date: view_employee_event_denormal.effdt_date
    sorts: [view_employee_event_denormal.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Internal Movements']

  - name: total_events
    title: Total Events
    type: single_value
    base_view: view_employee_event_denormal
    measures: [view_employee_event_denormal.movements]
    listen:
      date: view_employee_event_denormal.effdt_date
    sorts: [view_employee_event_denormal.movements desc]
    show_null_labels: false
    width: 4
    height: 2