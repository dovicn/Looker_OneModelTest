- dashboard: recruitment
  title: Recruitment
  layout: tile
  tile_size: 100
  
  filters:
  
  - name: date
    title: "Time Period"
    type: date_filter
    default_value: last 3 months

  elements:
  
  - name: total_interviews
    title: Total Interviews
    type: single_value
    base_view: measures_base
    measures: [measures_base.total_interviews]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.total_interviews desc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2

  - name: hires_staffing
    title: Hires - Staffing
    type: single_value
    base_view: measures_base
    measures: [measures_base.hires_staffing]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.hires_staffing asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
  
  - name: offers_made
    title: Offers Made
    type: single_value
    base_view: measures_base
    measures: [measures_base.offers_made]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.offers_made asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
  
  - name: offers_accepted
    title: Offers Accepted
    type: single_value
    base_view: measures_base
    measures: [measures_base.offers_accepted]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.offers_accpeted asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
    
  - name: offers_declined
    title: Offers Declined
    type: single_value
    base_view: measures_base
    measures: [measures_base.offers_declined]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.offers_declined asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
    
    
  - name: number_of_applications
    title: Number of Applications
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.number_of_applications]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: ''
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Applications']
    hide_legend: true
    width: 6
    height: 4
  
  - name: number_of_candidates
    title: Number of candidates
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.number_of_candidates]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: ''
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Candidates']
    hide_legend: true
    width: 6
    height: 4
    
  - name: number_of_requisitions
    title: Number of Requisitions
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.number_of_requisitions]
    listen:
      date: measures_base.todate_date
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: ''
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Requisitions']
    hide_legend: true
    width: 6
    height: 4
    
  