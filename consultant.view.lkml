view: consultant {
  sql_table_name: ProServices.Consultant ;;

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: id_consultant {
    type: number
    sql: ${TABLE}.idConsultant ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
