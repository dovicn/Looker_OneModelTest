- view: dim_event_reason
  sql_table_name: one.dim_event_reason
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.id

  - dimension: level1desc
    sql: ${TABLE}.level1desc

  - dimension: level2desc
    sql: ${TABLE}.level2desc

  - dimension: level3desc
    sql: ${TABLE}.level3desc

  - dimension: level4desc
    sql: ${TABLE}.level4desc

