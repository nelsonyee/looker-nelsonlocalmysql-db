connection: "nelsonmysql"

# include all the views
include: "*.view"

access_grant: can_view_hr_data {
  user_attribute: department
  allowed_values: [ "HR"]
}

datagroup: nelsonmysql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: projects_datagroup {
  sql_trigger: SELECT max(idProject) FROM project ;;
  max_cache_age: "2 hours"
}

persist_with: nelsonmysql_default_datagroup

explore: consultant {
  sql_always_where: ${company} in ({{ _user_attributes["company_name"] }}) ;;
}


explore: engagement_manager {}


explore: project {
  sql_always_where: ${consultant.company} in ({{ _user_attributes['company_name'] }}) ;;
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

explore: consultant_project_facts {}
