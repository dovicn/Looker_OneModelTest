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
    base_view: employee_event
    dimensions: [dim_event_reason.level1desc, employee_event.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [employee_event.eventoccurrence]
    filters:
      dim_event_reason.level1desc: "Hire"
    listen:
      date: employee_event.effdt_date
    sorts: [employee_event.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Hires']

  - name: terminations_over_time
    title: Terminations
    type: looker_column
    base_view: employee_event
    dimensions: [dim_event_reason.level1desc, employee_event.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [employee_event.eventoccurrence]
    filters:
      dim_event_reason.level1desc: "%Termination%"
    listen:
      date: employee_event.effdt_date
    sorts: [employee_event.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Terminations']

  - name: movements_over_time
    title: Movements
    type: looker_column
    base_view: employee_event
    dimensions: [dim_event_reason.level1desc, employee_event.effdt_month]
    pivots: [dim_event_reason.level1desc]
    measures: [employee_event.eventoccurrence]
    filters:
      dim_event_reason.level1desc: -"Hire", -"Voluntary Termination", -"Involuntary Termination", -"Other Terminations"
    listen:
      date: employee_event.effdt_date
    sorts: [employee_event.effdt_month asc]
    limit: 500
    show_null_labels: false
    stacking: normal
    x_axis_label_rotation: -45
    y_axis_labels: ['Movements']

  - name: total_events
    title: Total Events
    type: single_value
    base_view: employee_event
    measures: [employee_event.eventoccurrence]
    listen:
      date: employee_event.effdt_date
    sorts: [employee_event.eventoccurrence desc]
    show_null_labels: false
    width: 4
    height: 2