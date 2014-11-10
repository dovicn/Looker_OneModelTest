- explore: events_with_cumulative_hc

- view: events_with_cumulative_hc
  derived_table:
    sql: |
      SELECT 
        DATE(employee_event.effdt) AS "employee_event.effdt_date",
        employee_event.eventid AS "employee_event.eventid",
        employee.department AS "employee.department",
        employee.gender AS "employee.gender",
        employee.positionid AS "employee.positionid",
        dim_event_reason.level1desc AS "dim_event_reason.level1desc",
        SUM(CASE WHEN dim_event_reason.level1desc = 'Hire'
              THEN 1 ELSE 0 END) 
      OVER (order by DATE(employee_event.effdt) rows unbounded preceding)  
       AS "employee_event.cumulative_hires",
        SUM(CASE WHEN dim_event_reason.level1desc LIKE '%Termination%'
              THEN 1 ELSE 0 END) 
      OVER (order by DATE(employee_event.effdt) rows unbounded preceding)  
       AS "employee_event.cumulative_terminations",
        SUM(CASE WHEN dim_event_reason.level1desc = 'Hire'
              THEN 1 ELSE 0 END) 
      OVER (order by DATE(employee_event.effdt) rows unbounded preceding)  
       - SUM(CASE WHEN dim_event_reason.level1desc LIKE '%Termination%'
              THEN 1 ELSE 0 END) 
      OVER (order by DATE(employee_event.effdt) rows unbounded preceding)  
       AS "employee_event.current_headcount"
      FROM one.employee_event AS employee_event
      LEFT JOIN one.employee AS employee ON employee_event.wkfid = employee.wkfid
      LEFT JOIN one.dim_event_reason AS dim_event_reason ON employee_event.eventreason = dim_event_reason.id
      WHERE {% condition employee_gender %} employee.gender {% endcondition %}
      
      GROUP BY 1,2,3,4,5,6
      ORDER BY 1 
  
  fields:
  - measure: count
    type: count
    detail: detail*

  - dimension_group: event_eff
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}."employee_event.effdt_date"

  - dimension: event_id
    type: number
    sql: ${TABLE}."employee_event.eventid"

  - dimension: employee_department
    sql: ${TABLE}."employee.department"

  - dimension: employee_gender
    sql: ${TABLE}."employee.gender"

  - dimension: employee_position_id
    sql: ${TABLE}."employee.positionid"

  - dimension: event_type
    sql: ${TABLE}."dim_event_reason.level1desc"
    
  - measure: total_hires
    type: count
    filters:
      event_type: 'Hire'
    detail: detail*

  - measure: total_terminations
    type: count
    filters:
      event_type: '%Termination%'      
    detail: detail*     

  - measure: termination_rate
    type: number
    format: '%0.2f%'
    sql: 100.0 * ${total_terminations} / NULLIF(${average_headcount},0)

  - dimension: cumulative_hires
    type: number
    sql: ${TABLE}."employee_event.cumulative_hires"

  - dimension: cumulative_terminations
    type: number
    sql: ${TABLE}."employee_event.cumulative_terminations"

  - dimension: current_headcount
    type: number
    sql: ${TABLE}."employee_event.current_headcount"
    
  - measure: average_headcount
    type: average
    sql: ${current_headcount} 

  sets:
    detail:
      - event_eff_date
      - event_id
      - employee_department
      - employee_gender
      - employee_position_id
      - event_type

