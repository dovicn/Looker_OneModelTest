- view: performance
  sql_table_name: one.performance
  fields:

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

  - dimension: iseodrecord
    type: yesno
    sql: ${TABLE}.iseodrecord

  - dimension: perfrating
    sql: ${TABLE}.perfrating

  - dimension: perfstatus
    sql: ${TABLE}.perfstatus

  - dimension: personid
    sql: ${TABLE}.personid

  - dimension: prevrating
    sql: ${TABLE}.prevrating

  - dimension: prevratingsamereviewtype
    sql: ${TABLE}.prevratingsamereviewtype

  - dimension_group: reviewdate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.reviewdate

  - dimension: reviewedby
    sql: ${TABLE}.reviewedby

  - dimension: reviewid
    type: int
    sql: ${TABLE}.reviewid

  - dimension: reviewocc
    type: int
    sql: ${TABLE}.reviewocc

  - dimension: reviewtype
    sql: ${TABLE}.reviewtype

  - dimension: revseqnr
    type: int
    sql: ${TABLE}.revseqnr

  - dimension: seqnr
    type: int
    sql: ${TABLE}.seqnr

  - dimension: wkfid
    type: int
    sql: ${TABLE}.wkfid

  - measure: count
    type: count
    drill_fields: []

