- view: dim_country
  sql_table_name: one.dim_country
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.id

  - dimension: level1desc
    sql: ${TABLE}.level1desc
