view: busroute {
  sql_table_name: ProServices.busroute ;;

  dimension: dest_latitude {
    type: number
    sql: ${TABLE}.dest_latitude ;;
  }

  dimension: dest_longitude {
    type: number
    sql: ${TABLE}.dest_longitude ;;
  }

  dimension: dest_primary_city {
    type: string
    sql: ${TABLE}.dest_primary_city ;;
  }

  dimension: dest_zip {
    type: string
    sql: ${TABLE}.dest_zip ;;
  }

  dimension: dest_location {
    type: location
    sql_latitude: ${TABLE}.dest_latitude ;;
    sql_longitude: ${TABLE}.dest_longitude ;;
  }

  dimension: origin_latitude {
    type: number
    sql: ${TABLE}.origin_latitude ;;
  }

  dimension: origin_longitude {
    type: number
    sql: ${TABLE}.origin_longitude ;;
  }

  dimension: origin_primary_city {
    type: string
    sql: ${TABLE}.origin_primary_city ;;
  }

  dimension: origin_zip {
    type: string
    sql: ${TABLE}.origin_zip ;;
  }

  dimension: origin_location {
    type: location
    sql_latitude: ${TABLE}.origin_latitude ;;
    sql_longitude: ${TABLE}.origin_longitude ;;
  }

  dimension: avg_daily_ridership {
    type: number
    sql: ${TABLE}.avg_daily_ridership ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
