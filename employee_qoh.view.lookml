- view: employee_qoh
  sql_table_name: one.employee_qoh
  fields:

  - dimension: earlyterm_qoh
    sql: ${TABLE}.earlyterm_qoh

  - dimension_group: effdt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effdt

  - dimension_group: enddt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.enddt

  - dimension: perf_qoh
    sql: ${TABLE}.perf_qoh

  - dimension: performancerating
    sql: ${TABLE}.performancerating

  - dimension: personid
    sql: ${TABLE}.personid

  - dimension: prevperf_qoh
    sql: ${TABLE}.prevperf_qoh

  - dimension: prevperfrating
    sql: ${TABLE}.prevperfrating

  - dimension: qoh_latest_pit_index
    sql: ${TABLE}.qoh_latest_pit_index

  - dimension: qoh_pit_index
    sql: ${TABLE}.qoh_pit_index

  - dimension: wkfid
    type: int
    sql: ${TABLE}.wkfid

  - measure: count
    type: count
    drill_fields: []

