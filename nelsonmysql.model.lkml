connection: "nelsonmysql"

include: "*.dashboard.lookml"

# include all the views
include: "*.view"
label: "1. nelson mysql"
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
  sql_always_where: ${company} in ('{{ _user_attributes['company_name'] }}') ;;
}

explore: zip {}

explore: busroute {}

explore: engagement_manager {}

explore: account {}

explore: project {
  sql_always_where: ${consultant.company} in ('{{ _user_attributes['company_name'] }}') ;;
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

map_layer: california {
  file: "caCountiesTopoSimple.json"
  property_key: "name"
}

explore: cacounty_population {
  view_label: "CA County Population"
  label: "CA County Population"
}

explore: california_map {}

view: california_map {
  derived_table: {
    sql:
    -- some quick dummy data to show
        SELECT
           "Shasta" AS county,
           178000 AS population
        UNION ALL
        SELECT
           "San Joaquin" AS county,
           716000 AS population
        UNION ALL
        SELECT
           "Monterey" AS county,
           422000 AS population
        UNION ALL
        SELECT
           "Contra Costa" AS county,
           1111000 AS population
        UNION ALL
        SELECT
           "Riverside" AS county,
           2240000 AS population
        UNION ALL
        SELECT
           "San Bernardino" AS county,
           2065000 AS population
        UNION ALL
        SELECT
           "Sacramento" AS county,
           1436000 AS population
        UNION ALL
        SELECT
           "Alameda" AS county,
           1530000 AS population
        UNION ALL
        SELECT
           "Fresno" AS county,
           943000 AS population
        UNION ALL
        SELECT
           "San Francisco" AS county,
           883000 AS population
        UNION ALL
        SELECT
           "Los Angeles" AS county,
           9900000 AS population
        UNION ALL
        SELECT
           "San Diego" AS county,
           3140000 AS population
        UNION ALL
        SELECT
           "Santa Clara" AS county,
           1809000 AS population
        UNION ALL
        SELECT
           "Orange" AS county,
           3056000 AS population
    ;;
  }

  dimension: county {
    sql: ${TABLE}.county ;;
    map_layer_name: california
  }

  measure: population {
    type: average
    sql: ${TABLE}.population ;;
  }

}

################################################
# GLOBAL                                       #
# Match on FULL CONTINENT NAME e.g. "Asia"     #
################################################

map_layer: world_continents {
  file: "world-continents.json"
  property_key: "continent"
}

explore: world_map {}

view: world_map {
  derived_table: {
    sql:
    -- some quick dummy data to show
        SELECT
           "Asia" AS continent,
           4581757408 AS population
        UNION ALL
        SELECT
           "Africa" as continent,
           1216130000 as population
        UNION ALL
        SELECT
           "Europe" AS continent,
           738849000 as population
        UNION ALL
        SELECT
           "North America" AS continent,
           579024000 as population
        UNION ALL
        SELECT
           "South America" AS continent,
           422535000 as population
        UNION ALL
        SELECT
           "Oceania" AS continent,
           38304000 as population
        UNION ALL
        SELECT
           "Antartica" AS continent,
           1106 as population
    ;;
  }

  dimension: continent {
    sql: ${TABLE}.continent ;;
    map_layer_name: world_continents
  }

  measure: population {
    type: average
    sql: ${TABLE}.population ;;
  }

}

map_layer: rhode_island_counties {
  file: "rhode_island.json"
  property_key: "NAME"
}

map_layer: rhode_island_region {
  file: "rhode_island.json"
  property_key: "REGION"
}

explore: rhode_island_counties {}
view: rhode_island_counties {
  label: "Rhode Island County"
  derived_table: {
    sql:
    -- some quick dummy data to show
    SELECT
    "Kent" AS ri_county,
    163861 AS ri_county_population
    UNION ALL
    SELECT
    "Bristol" AS ri_county,
    48649 AS ri_county_population
    UNION ALL
    SELECT
    "Newport" AS ri_county,
    82542 AS ri_county_population
    UNION ALL
    SELECT
    "Providence" AS ri_county,
    636084 AS ri_county_population
    UNION ALL
    SELECT
    "Washington" AS ri_county,
    126179 AS ri_county_population
    ;;
  }

  dimension: ri_county {
    sql: ${TABLE}.ri_county ;;
    label: "County Name"
    map_layer_name: rhode_island_counties
  }

  measure: ri_county_population {
    type: average
    label: "Population"
    sql: ${TABLE}.ri_county_population ;;
  }
}

explore: rhode_island_regions {}
view: rhode_island_regions {
  derived_table: {
    sql:
        -- some quick dummy data to show
        SELECT
        "North RI" AS ri_region,
        848594 AS ri_region_population
        UNION ALL
        SELECT
        "South RI" AS ri_region,
        208721 AS ri_region_population
        ;;
  }

  dimension: ri_regions {
    sql: ${TABLE}.ri_region;;
    label: "Region Name"
    map_layer_name: rhode_island_region
  }

  measure: ri_region_population {
    label: "Population"
    type: average
    sql: ${TABLE}.ri_region_population ;;
  }
}

map_layer: colorado_region {
  file: "colorado.topojson"
  property_key: "REGION"
}

explore: colorado_regions {}
view: colorado_regions {
  derived_table: {
    sql:
        -- some quick dummy data to show
        SELECT
        "West Colorado" AS co_region,
        2000594 AS co_region_population
        UNION ALL
        SELECT
        "East Colorado" AS co_region,
        3920872 AS co_region_population
        ;;
  }

  dimension: co_regions {
    sql: ${TABLE}.co_region;;
    label: "Colorado Regions"
    map_layer_name: colorado_region
  }

  measure: ri_region_population {
    label: "Colorado Population by Region"
    type: average
    sql: ${TABLE}.co_region_population ;;
  }
}
