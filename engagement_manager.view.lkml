view: engagement_manager {
  sql_table_name: ProServices.Engagement_Manager ;;

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: id_engagement_manager {
    primary_key: yes
    type: number
    sql: ${TABLE}.idEngagement_Manager ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: ssn {
    required_access_grants: [can_view_hr_data]
    label: "SSN"
    type: string
    sql: ${TABLE}.SSN ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }
}
