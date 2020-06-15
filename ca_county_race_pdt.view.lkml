view: ca_county_race_pdt {
  derived_table: {
    datagroup_trigger: ca_county_datagroup
    indexes: ["population_by_race"]
    sql: SELECT
        caagerace.CountyName  AS `caagerace.county_name`,
        caagerace.RaceName  AS `caagerace.race_name`,
        SUM(caagerace.Pop2010) AS population_by_race,
        SUM(sum(caagerace.Pop2010)) OVER(PARTITION BY CountyName) AS total_county_population,
        ROUND((((SUM(caagerace.Pop2010))/(SUM(sum(caagerace.Pop2010)) OVER(PARTITION BY CountyName)))*100),2) as percent
      FROM ProServices.caagerace  AS caagerace

      WHERE
        (caagerace.CountyName not in ('California'))
      GROUP BY 1,2
      ORDER BY 1,3 DESC
      LIMIT 500
       ;;
  }

  filter: county_comparitor {
    type: string
    suggest_dimension: caagerace_county_name
    suggest_explore: ca_county_race_pdt
  }

  dimension: county_comparison {
    type: string
    sql: CASE WHEN {% condition county_comparitor %} ${caagerace_county_name} {% endcondition %} THEN ${caagerace_county_name}
    ELSE "All Other Counties"
  END ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: caagerace_county_name {
    label: "County"
    type: string
    sql: ${TABLE}.`caagerace.county_name` ;;
  }

  dimension: caagerace_race_name {
    label: "Race"
    type: string
    sql: ${TABLE}.`caagerace.race_name` ;;
  }

  measure: population_by_race {
    type: sum
    sql: ${TABLE}.population_by_race ;;
  }

  dimension: total_county_population {
    label: "Total Population"
    type: number
    sql: ${TABLE}.total_county_population ;;
  }

  measure: percent {
    type: average
    value_format: "0.0\%"
    sql: ${TABLE}.percent ;;
  }

  set: detail {
    fields: [caagerace_county_name, caagerace_race_name, population_by_race, total_county_population, percent]
  }
}
