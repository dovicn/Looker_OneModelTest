- view: candidates
  sql_table_name: one.candidates
  fields:

  - dimension: candidateid
    primary_key: true
    sql: ${TABLE}.candidateid

  - dimension_group: dob
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.dob

  - dimension: educationlevel
    sql: ${TABLE}.educationlevel

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

  - dimension: ethnicgroup
    sql: ${TABLE}.ethnicgroup

  - dimension: firstname
    sql: ${TABLE}.firstname

  - dimension: fullname
    sql: ${TABLE}.fullname

  - dimension: gender
    sql: ${TABLE}.gender

  - dimension: homecity
    sql: ${TABLE}.homecity

  - dimension: homecountry
    sql: ${TABLE}.homecountry

  - dimension: homestate
    sql: ${TABLE}.homestate

  - dimension: homezip
    sql: ${TABLE}.homezip

  - dimension: lastname
    sql: ${TABLE}.lastname

  - dimension: nationality
    sql: ${TABLE}.nationality

  - dimension: personid
    sql: ${TABLE}.personid

  - dimension: rcm_cand_id
    type: int
    sql: ${TABLE}.rcm_cand_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - candidateid
    - fullname
    - firstname
    - lastname
    - applications.count
    - view_rcm_applications_denormal.count
    - view_rcm_candidates_denormal.count

