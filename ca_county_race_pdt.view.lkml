view: ca_county_race_pdt {
  derived_table: {
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: caagerace_county_name {
    type: string
    sql: ${TABLE}.`caagerace.county_name` ;;
  }

  dimension: caagerace_race_name {
    type: string
    sql: ${TABLE}.`caagerace.race_name` ;;
  }

  dimension: population_by_race {
    type: number
    sql: ${TABLE}.population_by_race ;;
  }

  dimension: total_county_population {
    type: number
    sql: ${TABLE}.total_county_population ;;
  }

  dimension: percent {
    type: number
    sql: ${TABLE}.percent ;;
  }

  set: detail {
    fields: [caagerace_county_name, caagerace_race_name, population_by_race, total_county_population, percent]
  }
}
