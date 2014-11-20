- connection: onemodel_redshift

- scoping: true                  # for backward compatibility
- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: employee
  joins:
    - join: dim_gender
      foreign_key: gender
    
    - join: dim_org_unit
      foreign_key: department
      
    - join: dim_performance_rating
      foreign_key: performancerating

- explore: employee_event
  joins:
  
    - join: employee
      foreign_key: wkfid
      
    - join: dim_event_reason
      foreign_key: eventreason
      
    - join: view_employee_timeperiods_day_denormal
      foreign_key: wkfid
      
- explore: dim_org_unit
- explore: dim_country

- explore: employee_qoh

- explore: performance

- explore: timeperiods

- explore: measures_employee_daily
  joins:
    - join: dim_gender
      foreign_key: gender
    
    - join: dim_country
      foreign_key: country
    
    - join: dim_org_unit
      foreign_key: department
      
    - join: dim_performance_rating
      foreign_key: performancerating

- explore: measures_base
  joins:
    - join: dim_gender
      foreign_key: gender
      
    - join: dim_country
      foreign_key: country
    
    - join: dim_org_unit
      foreign_key: department
      
    - join: dim_performance_rating
      foreign_key: performance_rating
    
    - join: dim_event_reason
      foreign_key: event_reason_id
