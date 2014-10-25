- view: view_employee_timeperiods_day_denormal
  sql_table_name: one.view_employee_timeperiods_day_denormal
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

  - dimension: iseodrecord
    type: yesno
    sql: ${TABLE}.iseodrecord
  
  - dimension: iseom
    type: yesno
    sql: ${TABLE}.iseom

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

  - dimension: tenure_months
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

  - dimension: wkfid
    type: int
    sql: ${TABLE}.wkfid

  - dimension: zip
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: [fullname, firstname, lastname]
  
  - measure: headcount_sum
    type: sum
    sql: ${TABLE}.headcount
    
  - measure: headcount_eom
    type: sum
    sql: ${TABLE}.headcount
    filters:
      iseom: yes

  - measure: headcount_avg
    type: avg
    sql: ${headcount_sum}