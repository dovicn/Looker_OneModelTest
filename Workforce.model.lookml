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
      

- explore: employee_qoh

- explore: performance

- explore: timeperiods

- explore: view_employee_event_denormal
  joins:
    - join: dim_gender
      foreign_key: gender
    
    - join: dim_org_unit
      foreign_key: department
      
    - join: dim_performance_rating
      foreign_key: performancerating
    
    - join: dim_event_reason
      foreign_key: eventreason


- explore: view_employee_timeperiods_day_denormal

- explore: view_performance_denormal

