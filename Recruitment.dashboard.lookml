- dashboard: recruitment
  title: Recruitment
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: hires_staffing
    title: Hires - Staffing
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_month]
    measures: [measures_base.hires_staffing]
    filters:
      measures_base.todate_date: 12 months
    sorts: [measures_base.todate_month asc]
    limit: 500
    stacking: ''
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Hires']
    hide_legend: true
    width: 8
    height: 4
    
  - name: offers_made
    title: Offers Made - Last 90 Days
    type: single_value
    base_view: measures_base
    measures: [measures_base.offers_made]
    filters:
      measures_base.todate_date: 90 days
    sorts: [measures_base.offers_made asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
  
  - name: offers_accepted
    title: Offers Accepted - Last 90 Days
    type: single_value
    base_view: measures_base
    measures: [measures_base.offers_accepted]
    filters:
      measures_base.todate_date: 90 days
    sorts: [measures_base.offers_accpeted asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2
    
  - name: offers_declined
    title: Offers Declined - Last 90 Days
    type: single_value
    base_view: measures_base
    measures: [measures_base.offers_declined]
    filters:
      measures_base.todate_date: 90 days
    sorts: [measures_base.offers_declined asc]
    limit: 500
    show_null_labels: false
    width: 3
    height: 2