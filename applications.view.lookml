- view: applications
  sql_table_name: one.applications
  fields:

  - dimension: applicationid
    primary_key: true
    sql: ${TABLE}.applicationid

  - dimension: application_source
    sql: ${TABLE}.application_source

  - dimension: application_status
    sql: ${TABLE}.application_status

  - dimension: candidateid
    # hidden: true
    sql: ${TABLE}.candidateid

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

  - dimension: iseod
    type: yesno
    sql: ${TABLE}.iseod

  - dimension: personid
    sql: ${TABLE}.personid

  - dimension: rcm_app_id
    type: int
    sql: ${TABLE}.rcm_app_id

  - dimension: rcm_req_id
    type: int
    sql: ${TABLE}.rcm_req_id

  - dimension: reqid
    sql: ${TABLE}.reqid

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
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - applicationid
    - candidates.candidateid
    - candidates.fullname
    - candidates.firstname
    - candidates.lastname
    - view_rcm_applications_denormal.count

