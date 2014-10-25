- view: timeperiods
  sql_table_name: one.timeperiods
  fields:

  - dimension_group: date
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date

  - dimension: day
    type: int
    sql: ${TABLE}.day

  - dimension: dayname
    sql: ${TABLE}.dayname

  - dimension: daynameabbrev
    sql: ${TABLE}.daynameabbrev

  - dimension: daynumberofyear
    type: int
    sql: ${TABLE}.daynumberofyear

  - dimension: daysinmonth
    type: int
    sql: ${TABLE}.daysinmonth

  - dimension: month
    type: int
    sql: ${TABLE}.month

  - dimension: monthname
    sql: ${TABLE}.monthname

  - dimension: quarter
    sql: ${TABLE}.quarter

  - dimension: quartername
    sql: ${TABLE}.quartername

  - dimension: week
    sql: ${TABLE}.week

  - dimension: year
    type: int
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: [quartername, monthname, dayname]

