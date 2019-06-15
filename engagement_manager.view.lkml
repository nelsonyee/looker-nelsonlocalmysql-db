view: engagement_manager {
  sql_table_name: ProServices.Engagement_Manager ;;

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: id_engagement_manager {
    type: number
    sql: ${TABLE}.idEngagement_Manager ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }
}
