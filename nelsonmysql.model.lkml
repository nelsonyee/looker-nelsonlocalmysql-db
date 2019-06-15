connection: "nelsonmysql"

# include all the views
include: "*.view"

datagroup: nelsonmysql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nelsonmysql_default_datagroup

explore: consultant {}

explore: engagement_manager {}


explore: project {
  join: consultant {
    type: left_outer
    relationship: many_to_one
    sql_on: ${consultant.id_consultant} = ${project.primary_analyst} ;;
  }
  join: engagement_manager {
    type: left_outer
    relationship: many_to_one
    sql_on: ${engagement_manager.id_engagement_manager} = ${project.em} ;;
  }
}