view: zip {
  sql_table_name: ProServices.zip ;;

  dimension: acceptable_cities {
    type: string
    sql: ${TABLE}.acceptable_cities ;;
  }

  dimension: area_codes {
    type: string
    sql: ${TABLE}.area_codes ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: decommissioned {
    type: number
    sql: ${TABLE}.decommissioned ;;
  }

  dimension: housing {
    type: number
    sql: ${TABLE}.housing ;;
  }

  dimension: landarea_misq {
    type: number
    sql: ${TABLE}.landarea_misq ;;
  }

  dimension: landarea_msq {
    type: number
    sql: ${TABLE}.landarea_msq ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: primary_city {
    type: string
    sql: ${TABLE}.primary_city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unacceptable_cities {
    type: string
    sql: ${TABLE}.unacceptable_cities ;;
  }

  dimension: waterarea_misq {
    type: number
    sql: ${TABLE}.waterarea_misq ;;
  }

  dimension: waterarea_msq {
    type: number
    sql: ${TABLE}.waterarea_msq ;;
  }

  dimension: world_region {
    type: string
    sql: ${TABLE}.world_region ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: zip_location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
