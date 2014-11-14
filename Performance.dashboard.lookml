- dashboard: performance
  title: Performance
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: improved_poor_performers
    title: Improved Poor Performers
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_year, measures_base.performance_rating_integer]
    pivots: [measures_base.performance_rating_integer]
    measures: [measures_base.improved_poor_performers]
    filters:
      measures_base.todate_date: 3 years
    sorts: [measures_base.todate_year asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Improved Poor Performers']
    hide_legend: true

  - name: review_occurrences
    title: Number of Employees Reviewed
    type: looker_column
    base_view: measures_base
    dimensions: [measures_base.todate_year, measures_base.performance_rating_integer]
    pivots: [measures_base.performance_rating_integer]
    measures: [measures_base.review_occurrences]
    filters:
      measures_base.todate_date: 3 years
    sorts: [measures_base.todate_year asc]
    limit: 500
    stacking: normal
    show_null_labels: false
    show_null_points: false
    x_axis_label_rotation: -45
    y_axis_labels: ['Number of Employees Reviewed']
    hide_legend: true