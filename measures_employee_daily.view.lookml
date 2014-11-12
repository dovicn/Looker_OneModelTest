- view: measures_employee_daily
  derived_table:
    sql: |
      SELECT emp.personid as person_id
      , timeperiods.date AS todate
      , CAST(timeperiods.year as VARCHAR) + CAST(timeperiods.month as VARCHAR) as timeperiod
      , emp.status
      , emp.fullname
      , emp.firstname
      , emp.lastname
      , date_diff('years', emp.dob, timeperiods.date) AS age
      , date_diff('months', emp.hiredate, timeperiods.date) AS tenure_months
      , CASE WHEN datepart(month, emp.dob) = datepart(month, timeperiods.date) AND datepart(day, emp.dob) = datepart(day, timeperiods.date) THEN 1 ELSE 0 END AS birthday_count
      , emp.dob
      , emp.gender
      , emp.nationality
      , emp.ethnicgroup as ethnic_group
      , emp.eeojob as eeo_job
      , emp.hiredate as hire_date
      , emp.tenuredate as tenure_date
      , emp.email
      , emp.phone
      , emp.salutation
      , emp.country
      , emp.state
      , emp.city
      , emp.building
      , emp."level"
      , emp.zip
      , emp.department
      , emp.costcenter
      , emp.positionid as position_id
      , emp.jobid as job_id
      , emp.jobfamily as job_family
      , emp.jobfunction as job_function
      , emp.critical
      , emp.manager
      , emp.matrixmanager as matrix_manager
      , emp.annualsalary as annual_salary
      , emp.annualsalaryrange as annual_salary_range
      , emp.bonus
      , emp.hourlyrate as hourly_rate
      , emp.performancerating as performance_rating
      , emp.prevperfrating as prev_perf_rating
      , emp.nineboxrating as ninebox_rating
      , emp.emptype as emp_type
      , emp.regtemp as reg_temp
      , emp.fullpart as full_part
      , emp.contractor
      , emp.riskofloss as risk_of_loss
      , emp.impactofloss as impact_of_loss
      , emp.ismanager as is_manager
      
      , emp.headcount 
      , emp.fte
      
      FROM one.employee emp
      INNER JOIN one.timeperiods 
      ON emp.effdt <= timeperiods.date 
      AND emp.enddt >= timeperiods.date 
      AND emp.headcount = 1

  fields:

  - dimension: age
    type: number
    sql: ${TABLE}.age

  - dimension: annualsalary
    type: number
    sql: ${TABLE}.annualsalary

  - dimension: annualsalaryrange
    sql: ${TABLE}.annualsalaryrange

  - dimension: birthday_count
    type: int
    sql: ${TABLE}.birthday_count

  - dimension: bonus
    type: number
    sql: ${TABLE}.bonus

  - dimension: building
    sql: ${TABLE}.building

  - dimension: city
    sql: ${TABLE}.city

  - dimension: contractor
    sql: ${TABLE}.contractor

  - dimension: costcenter
    sql: ${TABLE}.costcenter

  - dimension: country
    sql: ${TABLE}.country

  - dimension: critical
    sql: ${TABLE}.critical

  - dimension: department
    sql: ${TABLE}.department

  - dimension_group: dob
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.dob

  - dimension: eeojob
    sql: ${TABLE}.eeojob

  - dimension_group: effdt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effdt

  - dimension: email
    sql: ${TABLE}.email

  - dimension: emptype
    sql: ${TABLE}.emptype

  - dimension_group: enddt
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.enddt

  - dimension: ethnicgroup
    sql: ${TABLE}.ethnicgroup

  - dimension: firstname
    sql: ${TABLE}.firstname

  - dimension: fte
    type: number
    sql: ${TABLE}.fte

  - dimension: fullname
    sql: ${TABLE}.fullname

  - dimension: fullpart
    sql: ${TABLE}.fullpart

  - dimension: gender
    sql: ${TABLE}.gender

  - dimension: headcount
    type: int
    sql: ${TABLE}.headcount

  - dimension_group: hiredate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.hiredate

  - dimension: hourlyrate
    type: number
    sql: ${TABLE}.hourlyrate

  - dimension: impactofloss
    sql: ${TABLE}.impactofloss

  - dimension: ismanager
    type: yesno
    sql: ${TABLE}.ismanager

  - dimension: jobfamily
    sql: ${TABLE}.jobfamily

  - dimension: jobfunction
    sql: ${TABLE}.jobfunction

  - dimension: jobid
    sql: ${TABLE}.jobid

  - dimension: lastname
    sql: ${TABLE}.lastname

  - dimension: level
    sql: ${TABLE}.level

  - dimension: manager
    sql: ${TABLE}.manager

  - dimension: matrixmanager
    sql: ${TABLE}.matrixmanager

  - dimension: nationality
    sql: ${TABLE}.nationality

  - dimension: nineboxrating
    sql: ${TABLE}.nineboxrating

  - dimension: performancerating
    sql: ${TABLE}.performancerating

  - dimension: personid
    sql: ${TABLE}.personid
    
  - dimension: personrcdrank
    type: int
    sql: ${TABLE}.personrcdrank

  - dimension: phone
    sql: ${TABLE}.phone

  - dimension: positionid
    sql: ${TABLE}.positionid

  - dimension: prevperfrating
    sql: ${TABLE}.prevperfrating

  - dimension: qualityhire
    sql: ${TABLE}.qualityhire

  - dimension: regtemp
    sql: ${TABLE}.regtemp

  - dimension: revseqnr
    type: int
    sql: ${TABLE}.revseqnr

  - dimension: riskofloss
    sql: ${TABLE}.riskofloss

  - dimension: salutation
    sql: ${TABLE}.salutation

  - dimension: seqnr
    type: int
    sql: ${TABLE}.seqnr

  - dimension: state
    sql: ${TABLE}.state

  - dimension: status
    sql: ${TABLE}.status

  - dimension: organization_tenure
    type: number
    sql: ${TABLE}.tenure_months

  - dimension_group: tenuredate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.tenuredate
    
  - dimension_group: todate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.todate


#   - dimension_group: todate
#     type: time
#     timeframes: [year]
#     convert_tz: false
#     sql: ${TABLE}.todate
#     html:                   Idea is to hack together a year -> month drillpath

  - dimension: wkfid
    type: int
    sql: ${TABLE}.wkfid

  - dimension: zip
    sql: ${TABLE}.zip


### Core daily metrics  
  - measure: headcount_daily
    type: sum
    sql: ${headcount}

  - measure: average_age_daily
    type: average
    sql: ${age}
  
  - measure: average_tenure_daily
    type: average
    sql: 1.0 * ${organization_tenure} / 12
    
  - measure: headcount_daily_male
    type: sum
    sql: ${headcount}
    filters:
      gender: 1
  
  - measure: headcount_daily_female
    type: sum
    sql: ${headcount}
    filters:
      gender: 2
  
  - measure: male_to_female_staffing_ratio
    type: number
    sql: 1.00 * ${headcount_daily_male} / NULLIF(${headcount_daily_female}, 0)
    decimals: 2
    
  - measure: staffing_rate_male
    type: number
    sql: 100.00 * ${headcount_daily_male} / NULLIF(${headcount_daily}, 0)
    format: "%5.2f%%"
  
  - measure: staffing_rate_female
    type: number
    sql: 100.00 * ${headcount_daily_female} / NULLIF(${headcount_daily}, 0)
    format: "%5.2f%%"

  # DW - Testing some daily aggregation
#  - measure: base_fte
#    type: sum
#    sql: ${TABLE}.fte
#  
#  - measure: days_so_far
#    type: count_distinct
#    sql: ${TABLE}.todate
#  
#  - measure: full_time_equivlent
#    type: number
#    sql: ${base_fte} / ${days_so_far}
#    
#  - measure: average_hc
#    type: number
#    sql: ${headcount_sum} / ${days_so_far}
