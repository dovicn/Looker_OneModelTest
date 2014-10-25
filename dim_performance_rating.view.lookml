- view: dim_performance_rating
  sql_table_name: one.dim_performance_rating
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.id

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

  - dimension: islatest
    type: yesno
    sql: ${TABLE}.islatest

  - dimension: level1desc
    sql: ${TABLE}.level1desc

  - dimension: level1id
    sql: ${TABLE}.level1id

  - dimension: level2desc
    sql: ${TABLE}.level2desc

  - dimension: level2id
    sql: ${TABLE}.level2id

  - dimension: level3desc
    sql: ${TABLE}.level3desc

  - dimension: level3id
    sql: ${TABLE}.level3id

  - dimension: level4desc
    sql: ${TABLE}.level4desc

  - dimension: level4id
    sql: ${TABLE}.level4id

  - measure: count
    type: count
    drill_fields: [id]

