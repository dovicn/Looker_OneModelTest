- view: view_rcm_requisitions_denormal
  sql_table_name: one.view_rcm_requisitions_denormal
  fields:

  - dimension: city
    sql: ${TABLE}.city

  - dimension: costcenter
    sql: ${TABLE}.costcenter

  - dimension: country
    sql: ${TABLE}.country

  - dimension: department
    sql: ${TABLE}.department

  - dimension: eeojob
    sql: ${TABLE}.eeojob

  - dimension_group: effdt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effdt

  - dimension: emptype
    sql: ${TABLE}.emptype

  - dimension_group: enddt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.enddt

  - dimension: hiringmanager
    sql: ${TABLE}.hiringmanager

  - dimension: jobfamily
    sql: ${TABLE}.jobfamily

  - dimension: jobfunction
    sql: ${TABLE}.jobfunction

  - dimension: location
    sql: ${TABLE}.location

  - dimension: maxsalary
    type: number
    sql: ${TABLE}.maxsalary

  - dimension: minsalary
    type: number
    sql: ${TABLE}.minsalary

  - dimension: number_positions
    type: int
    sql: ${TABLE}.number_positions

  - dimension: req_status
    sql: ${TABLE}.req_status

  - dimension: reqid
    sql: ${TABLE}.reqid

  - dimension: state
    sql: ${TABLE}.state

  - dimension_group: todate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.todate

  - dimension: zip
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: []

