- view: view_rcm_applications_denormal
  sql_table_name: one.view_rcm_applications_denormal
  fields:

  - dimension: application_source
    sql: ${TABLE}.application_source

  - dimension: application_status
    sql: ${TABLE}.application_status

  - dimension: applicationid
    # hidden: true
    sql: ${TABLE}.applicationid

  - dimension: candidateid
    # hidden: true
    sql: ${TABLE}.candidateid

  - dimension: department
    sql: ${TABLE}.department

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

  - dimension: rcm_app_id
    type: int
    sql: ${TABLE}.rcm_app_id

  - dimension: rcm_req_id
    type: int
    sql: ${TABLE}.rcm_req_id

  - dimension: req_status
    sql: ${TABLE}.req_status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - fullname
    - firstname
    - lastname
    - applications.applicationid
    - candidates.candidateid
    - candidates.fullname
    - candidates.firstname
    - candidates.lastname

