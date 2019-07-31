connection: "nelsonmysql"

include: "*.dashboard.lookml"

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

#datagroup: projects_datagroup {
# sql_trigger: SELECT max(idProject) FROM project ;;
#  max_cache_age: "2 hours"
#}

datagroup: em_datagroup {
  sql_trigger: SELECT max(idProject) FROM project ;;
  max_cache_age: "2 hours"
}

persist_with: nelsonmysql_default_datagroup

explore: consultant {
  sql_always_where: ${company} in ({{ _user_attributes["company_name"] }}) ;;
}


explore: engagement_manager {}

explore: account {}

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
  join: account {
    type: left_outer
    relationship: one_to_one
    sql_on: ${account.account_name} = ${project.customer} ;;
  }
}


##explore: consultant_project_facts {}
explore: engagement_manager_test_pdt {
  label: "Engagement Manager PDT Test"
}

map_layer: bayarea {
  file: "bayarea.topojson"
  property_key: "bayarea"
}

map_layer: belgium_provinces {
  file: "belgium-provinces.topojson"
  property_key: "NAME_1"
}

explore: example_map {}

view: example_map {
  derived_table: {
    sql:
    -- some quick dummy data to show
        SELECT
           "West Flanders" AS province,
           17.63 AS value
        UNION ALL
        SELECT
           "East Flanders" AS province,
           13.34 AS value
        UNION ALL
        SELECT
           "Antwerp" AS province,
           11.57 AS value
        UNION ALL
        SELECT
           "Flemish Brabant" AS province,
           17.63 AS value
        UNION ALL
        SELECT
           "Limburg" AS province,
           17.71 AS value
        UNION ALL
        SELECT
           "Brussels" AS province,
           26.80 AS value
        UNION ALL
        SELECT
           "Walloon Brabant" AS province,
           21.41 AS value
        UNION ALL
        SELECT
           "Hainaut" AS province,
           41.04 AS value
        UNION ALL
        SELECT
           "Namur" AS province,
           27.83 AS value
        UNION ALL
        SELECT
           "Liege" AS province,
           30.00 AS value
        UNION ALL
        SELECT
           "Luxembourg" AS province,
           22.02 AS value
    ;;
  }

  dimension: province {
    sql: ${TABLE}.province ;;
    map_layer_name: belgium_provinces
  }

  measure: value {
    type: average
    sql: ${TABLE}.value ;;
  }

}
