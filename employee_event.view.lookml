- view: employee_event
  sql_table_name: one.employee_event
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

  - dimension: event
    sql: ${TABLE}.event

  - dimension_group: eventdate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.eventdate

  - dimension: eventdescr
    sql: ${TABLE}.eventdescr

  - dimension: eventid
    type: int
    sql: ${TABLE}.eventid

  - dimension: eventreason
    sql: ${TABLE}.eventreason

  - dimension: eventreasondescr
    sql: ${TABLE}.eventreasondescr

  - dimension: eventstatus
    sql: ${TABLE}.eventstatus

  - dimension: iseodrecord
    type: yesno
    sql: ${TABLE}.iseodrecord

  - dimension: isprimaryevent
    type: yesno
    sql: ${TABLE}.isprimaryevent

  - dimension: personid
    sql: ${TABLE}.personid

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
  
    
  - measure: cumulative_hires
    type: number
    sql: |
      SUM(CASE WHEN ${dim_event_reason.level1desc} = 'Hire'
              THEN 1 ELSE 0 END) 
      OVER (order by ${employee_event.effdt_date} rows unbounded preceding)  

  - measure: cumulative_terminations
    type: number
    sql: |
      SUM(CASE WHEN ${dim_event_reason.level1desc} LIKE '%Termination%'
              THEN 1 ELSE 0 END) 
      OVER (order by ${employee_event.effdt_date} rows unbounded preceding)  
      
  - measure: current_headcount
    type: number
    sql: ${cumulative_hires} - ${cumulative_terminations}
    
  - measure: eventoccurrence
    type: sum
    sql: ${TABLE}.eventoccurrence
    
  - measure: event_occurrence_rate
    type: number
    sql: ${eventoccurrence} / ${view_employee_timeperiods_day_denormal.average_hc}
