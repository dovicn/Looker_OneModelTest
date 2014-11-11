- view: measures_base
  sql_table_name: one.measures_base
      
  fields:
    - dimension: todate
      type: time
      timeframes: [date, month, year]
      convert_tz: false
      sql: ${TABLE}.todate
    
    - dimension: data_source
      type: string
      sql: ${TABLE}.data_source
    
    - dimension: eventtype
      type: string
      sql: ${TABLE}.eventtype
      
    - dimension: gender
      type: string
      sql: ${TABLE}.gender
      
    - dimension: country
      type: string
      sql: ${TABLE}.country
    
    - dimension: state
      type: string
      sql: ${TABLE}.state
    
    - dimension: department
      type: string
      sql: ${TABLE}.deparment
      
    - dimension: performance_rating
      type: string
      sql: ${TABLE}.performance_rating
      
    - dimension: event_reason_id
      type: string
      sql: ${TABLE}.event_reason_id
    
    - dimension: average_hc
      type: number
      sql: ${TABLE}.average_hc
    
    - dimension: fte
      type: number
      sql: ${TABLE}.fte
    
    - dimension: eom_hc
      type: int
      sql: ${TABLE}.eom_hc
      
    - dimension: som_hc
      type: int
      sql: ${TABLE}.som_hc
    
    - dimension: event_type
      type: string
      sql: ${TABLE}.event_type
    
    - dimension: event_reason
      type: string
      sql: ${TABLE}.event_reason_id
    
    - dimension: event_occurrence
      type: int
      sql: ${TABLE}.event_occurrence
    
    - measure: average_headcount
      type: sum
      sql: ${average_hc}
  
    - measure: end_of_month_headcount
      type: sum
      sql: ${eom_hc}
      
    - measure: start_of_month_headcount
      type: sum
      sql: ${som_hc}
      
    - measure: full_time_equivalent
      type: sum
      sql: ${fte}
      
    - measure: hires
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Hire'
      
    - measure: terminations
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: '%Termination%'
        
    - measure: internal_movements
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Transfer,Promotion,Demotion'
    
    - measure: internal_movements_rate
      type: number
      sql: 100.00 * ${internal_movements} / NULLIF(${average_headcount}, 0)
      decimals: 2
    
    - measure: net_hire_ratio
      type: number
      sql: 1.00 * ${hires} / NULLIF(${terminations}, 0)
      decimals: 2
