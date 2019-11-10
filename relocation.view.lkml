view: relocation {
  sql_table_name: ProServices.relocation ;;

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
    type: zipcode
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
    type: zipcode
    sql: ${TABLE}.origin_zip ;;
  }

  dimension: origin_location {
    type: location
    sql_latitude: ${TABLE}.origin_latitude ;;
    sql_longitude: ${TABLE}.origin_longitude ;;
  }

  dimension: residents_leaving {
    type: number
    sql: ${TABLE}.residents_leaving ;;
  }

  measure: residents_relocating {
    type: sum
    sql: ${TABLE}.residents_leaving ;;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
