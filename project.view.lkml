view: project {
  sql_table_name: ProServices.Project ;;

  dimension: em {
    type: number
    hidden: yes
    sql: ${TABLE}.EM ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }

  dimension: hours_remaining {
    type: number
    sql: ${TABLE}.HoursRemaining ;;
  }

  dimension: id_project {
    primary_key: yes
    type: number
    sql: ${TABLE}.idProject ;;
  }

  dimension: percent_complete {
    type: number
    sql: ${TABLE}.PercentComplete ;;
    value_format: "0\%"
  }

  dimension: planned_hours {
    type: number
    sql: ${TABLE}.PlannedHours ;;
  }

  dimension: primary_analyst {
    type: number
    hidden: yes
    sql: ${TABLE}.PrimaryAnalyst ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }


  dimension: project_name {
    type: string
    sql: ${TABLE}.ProjectName ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartDate ;;
  }

  dimension: total_billable_hours {
    type: number
    sql: ${TABLE}.TotalBillableHours ;;
  }

  measure: count {
    type: count
    drill_fields: [project_name]
  }

  measure: project_duration {
    type: number
    sql: datediff (${end_date},${start_date}) ;;
  }
  set: project_name {
    fields: [project_name, start_date, end_date, percent_complete]

  }
}
