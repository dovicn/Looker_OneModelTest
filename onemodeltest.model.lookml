- connection: onemodel_redshift

- scoping: true                  # for backward compatibility
- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: applications
  joins:
    - join: candidates
      foreign_key: candidateid


- explore: candidates

- explore: dim_annual_salary_range

- explore: dim_app_source

- explore: dim_app_status

- explore: dim_employment_status

- explore: dim_event

- explore: dim_event_reason

- explore: dim_full_part_time

- explore: dim_gender

- explore: dim_org_unit

- explore: dim_performance_rating

- explore: dim_performance_rating_prev

- explore: dim_qoh_index

- explore: dim_reg_temp

- explore: dim_req_status

- explore: employee
  joins:
    - join: dim_gender
      foreign_key: gender
    
    - join: dim_org_unit
      foreign_key: department

- explore: employee_event
  joins:
  
    - join: employee
      foreign_key: wkfid
      
    - join: dim_event_reason
      foreign_key: eventreason

- explore: employee_qoh

- explore: employee_timeline

- explore: performance

- explore: requisitions

- explore: timeperiods

- explore: view_employee_event_denormal

- explore: view_employee_timeperiods_day_denormal

- explore: view_performance_denormal

- explore: view_rcm_applications_denormal
  joins:
    - join: applications
      foreign_key: applicationid

    - join: candidates
      foreign_key: candidateid


- explore: view_rcm_candidates_denormal
  joins:
    - join: candidates
      foreign_key: candidateid


- explore: view_rcm_requisitions_denormal

