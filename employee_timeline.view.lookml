- view: employee_timeline
  sql_table_name: one.employee_timeline
  fields:

  - dimension_group: begda
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.begda

  - dimension_group: endda
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.endda

  - dimension: pernr
    sql: ${TABLE}.pernr

  - measure: count
    type: count
    drill_fields: []

