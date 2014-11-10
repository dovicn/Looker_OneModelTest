- explore: daily_events

- view: daily_events
  derived_table:
    sql: |
      SELECT 
        DATE(employee_event.effdt) AS effdt
        ,SUM(CASE WHEN dim_event_reason.level1desc = 'Hire'
                THEN 1 ELSE 0
                END) AS number_of_hires
        ,SUM(CASE WHEN dim_event_reason.level1desc LIKE '%Termination%'
                THEN 1 ELSE 0
                END) AS number_of_terminations
      FROM one.employee_event AS employee_event
      LEFT JOIN one.dim_event_reason AS dim_event_reason ON employee_event.eventreason = dim_event_reason.id
      WHERE
        {% condition effdt_date %} employee_event.effdt {% endcondition %}
      GROUP BY 1

  fields:
#   - measure: count
#     type: count
#     detail: detail*

  - dimension: effdt_date
    type: date
    primary_key: true
    sql: ${TABLE}.effdt

  - dimension_group: effdt
    type: time
    timeframes: [month, year]
    sql: ${TABLE}.effdt

  - dimension: number_of_hires
    type: number
    sql: ${TABLE}.number_of_hires
    
  - measure: average_number_of_hires
    type: average
    sql: ${number_of_hires}

  - measure: total_number_of_hires
    type: average
    sql: ${number_of_terminations}

  - dimension: number_of_terminations
    type: number
    sql: ${TABLE}.number_of_terminations
    
  - measure: average_number_of_terminations
    type: average
    sql: ${number_of_terminations}

  - measure: total_number_of_terminations
    type: sum
    sql: ${number_of_terminations}
    
  - measure: avg_daily_term_rate
    description: Average Daily Termination Count over Average Daily Headcount
    type: number
    format: '%0.4f%'
    sql: 100.0 * ${average_number_of_terminations} /  ${daily_status.average_headcount}
    
  - measure: termination_rate
    description: Total Terminations over Time Period over Average Daily Headcount
    type: number
    format: '%0.2f%'
    sql: 100.0 * ${total_number_of_terminations} /  ${daily_status.average_headcount}

  

  sets:
    detail:
      - effdt
      - number_of_hires
      - number_of_terminations

