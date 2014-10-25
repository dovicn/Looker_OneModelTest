- view: view_performance_denormal
  sql_table_name: one.view_performance_denormal
  fields:

  - dimension: annualsalary
    type: number
    sql: ${TABLE}.annualsalary

  - dimension: annualsalaryrange
    sql: ${TABLE}.annualsalaryrange

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

  - dimension: fullname
    sql: ${TABLE}.fullname

  - dimension: fullpart
    sql: ${TABLE}.fullpart

  - dimension: gender
    sql: ${TABLE}.gender

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

  - dimension: perfrating
    sql: ${TABLE}.perfrating

  - dimension: perfstatus
    sql: ${TABLE}.perfstatus

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

  - dimension: prevrating
    sql: ${TABLE}.prevrating

  - dimension: prevratingsamereviewtype
    sql: ${TABLE}.prevratingsamereviewtype

  - dimension: qualityhire
    sql: ${TABLE}.qualityhire

  - dimension: regtemp
    sql: ${TABLE}.regtemp

  - dimension_group: reviewdate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.reviewdate

  - dimension: reviewedby
    sql: ${TABLE}.reviewedby

  - dimension: reviewocc
    type: int
    sql: ${TABLE}.reviewocc

  - dimension: reviewtype
    sql: ${TABLE}.reviewtype

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

  - dimension_group: tenuredate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.tenuredate

  - dimension: wkfid
    type: int
    sql: ${TABLE}.wkfid

  - dimension: zip
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: [fullname, firstname, lastname]

