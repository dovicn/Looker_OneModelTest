- explore: daily_status
  joins:
    - join: daily_events
      foreign_key: effdt_date


- view: daily_status
  derived_table:
    sql: |
      SELECT 
        DATE(view_employee_timeperiods_day_denormal.todate) AS effdt,
        SUM(view_employee_timeperiods_day_denormal.headcount) AS headcount
      FROM one.view_employee_timeperiods_day_denormal AS view_employee_timeperiods_day_denormal
      WHERE
        {% condition effdt_date %} view_employee_timeperiods_day_denormal.todate {% endcondition %}
      GROUP BY 1
      ORDER BY 1 DESC

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
    timeframes: [week, month, year]
    sql: ${TABLE}.effdt

  - dimension: headcount
    type: number
    sql: ${TABLE}.headcount
    
  - measure: average_headcount
    type: average
    sql: ${headcount}

  sets:
    detail:
      - effdt
      - headcount

