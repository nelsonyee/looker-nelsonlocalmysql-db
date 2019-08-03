view: cacounty_population {
  sql_table_name: ProServices.CACountyPopulation ;;

  dimension: cacounty_name {
    view_label: "CA County Name"
    label: "CA County Name"
    type: string
    map_layer_name: california
    sql: ${TABLE}.CACountyName ;;
  }

  measure: county2018_population {
    view_label: "2018 Population"
    label: "2018 Population"
    type: number
    sql: ${TABLE}.County2018Population ;;
  }

  measure: county2019_population {
    view_label: "2019 Population"
    label: "2019 Population"
    type: number
    sql: ${TABLE}.County2019Population ;;
  }

  dimension: id_cacounty_population {
    hidden: yes
    type: number
    sql: ${TABLE}.idCACountyPopulation ;;
  }

  measure: yoypercent_change {
    view_label: "Year Over Year Population % Change"
    label: "Year Over Year Population % Change"
    type: number
    sql: ${TABLE}.YOYPercentChange ;;
  }

  measure: count {
    label: "Number of CA Counties"
    type: count
    drill_fields: [cacounty_name]
  }
}
