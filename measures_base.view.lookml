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
    
    - dimension: age
      type: int
      sql: ${TABLE}.age
      
    - dimension: gender
      type: string
      sql: ${TABLE}.gender
    
    - dimension: organization_tenure
      type: int
      sql: ${TABLE}.tenure_months
    
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

### Headcount Section
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
    
    - measure: eom_average_age
      type: average
      sql: ${age}
      filters:
        eom_hc: 1
    
    - measure: eom_average_tenure
      type: average
      sql: 1.0 * ${organization_tenure} / 12
      filters:
        eom_hc: 1
    
    - measure: eom_headcount_male
      type: sum
      sql: ${eom_hc}
      filters:
        gender: 1
    
    - measure: eom_headcount_female
      type: sum
      sql: ${eom_hc}
      filters:
        gender: 2
    
    - measure: eom_headcount_approaching_retirement_eligiblity
      type: sum
      sql: ${eom_hc}
      filters:
        age: '>55'
    
    - measure: staffing_rate_approaching_retirement_eligiblity
      type: number
      sql: 100.00 * ${eom_headcount_approaching_retirement_eligiblity} / NULLIF(${end_of_month_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: staffing_rate_male
      type: number
      sql: 100.00 * ${eom_headcount_male} / NULLIF(${end_of_month_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: staffing_rate_female
      type: number
      sql: 100.00 * ${eom_headcount_female} / NULLIF(${end_of_month_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: male_to_female_staffing_ratio
      type: number
      sql: 1.00 * ${eom_headcount_male} / NULLIF(${eom_headcount_female}, 0)
      decimals: 2
    
### Mobility Section
    - measure: hires
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Hire'
    
    - measure: hire_rate
      type: number
      sql: 100.00 * ${hires} / NULLIF(${average_headcount}, 0)
      format: "%5.2f%%"
          
    - measure: terminations
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: '%Termination%'
    
    - measure: termination_rate
      type: number
      sql: 100.00 * ${terminations} / NULLIF(${average_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: internal_movements
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Transfer,Promotion,Demotion'
    
    - measure: internal_movements_rate
      type: number
      sql: 100.00 * ${internal_movements} / NULLIF(${average_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: promotions
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Promotion'
    
    - measure: promotion_rate
      type: number
      sql: 100.00 * ${promotions} / NULLIF(${average_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: transfers
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Transfer'
    
    - measure: transfer_rate
      type: number
      sql: 100.00 * ${transfers} / NULLIF(${average_headcount}, 0)
      format: "%5.2f%%"
      
    - measure: demotions
      type: sum
      sql: ${event_occurrence}
      filters:
        event_type: 'Demotion'
    
    - measure: demotion_rate
      type: number
      sql: 100.00 * ${demotions} / NULLIF(${average_headcount}, 0)
      format: "%5.2f%%"
    
    - measure: lateral_mobility
      type: number
      sql: 100.00 * ${transfers} / NULLIF(${internal_movements}, 0)
      format: "%5.2f%%"
    
    - measure: upward_mobility
      type: number
      sql: 100.00 * ${promotions} / NULLIF(${internal_movements}, 0)
      format: "%5.2f%%"
    
    - measure: downward_mobility
      type: number
      sql: 100.00 * ${demotions} / NULLIF(${internal_movements}, 0)
      format: "%5.2f%%"
    
    - measure: net_hire_ratio
      type: number
      sql: 1.00 * ${hires} / NULLIF(${terminations}, 0)
      decimals: 2
