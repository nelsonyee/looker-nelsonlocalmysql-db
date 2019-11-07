view: cacounty_population {
  sql_table_name: ProServices.CACountyPopulation ;;

  dimension: cacounty_name {
    view_label: "CA County Name"
    label: "CA County Name"
    type: string
    map_layer_name: california
    sql: ${TABLE}.CACountyName ;;
  }

  dimension: county2018_population {
    view_label: "2018 Population"
    label: "2018 Population"
    type: number
    sql: ${TABLE}.County2018Population ;;
  }

  dimension: county2019_population {
    view_label: "2019 Population"
    label: "2019 Population"
    type: number
    sql: ${TABLE}.County2019Population ;;
  }

  measure: ca_population {
    label: "2019 CA Population"
    type: sum
    sql: ${county2019_population} ;;
  }

  dimension: id_cacounty_population {
    hidden: yes
    type: number
    sql: ${TABLE}.idCACountyPopulation ;;
  }

  dimension: population_category_value {
    sql: ${county2019_population};;
    html: {% if value >= 1000000 %}
      <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>

{% elsif value >= 500000 and value < 1000000 %}
      <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>

{% elsif value >= 100000 and value < 500000 %}
      <b><p style="color: black; background-color: #00ff00; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>

{% else %}
      <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</p></b>
{% endif %}
    ;;
  }

  dimension: population_category {
    sql: ${county2019_population};;
    html: {% if value >= 1000000 %}
      <b><p style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ "1 Million and Over" }}</p></b>

{% elsif value >= 500000 and value < 1000000 %}
      <b><p style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ "Between 500K and < 1M" }}</p></b>

{% elsif value >= 100000 and value < 500000 %}
      <b><p style="color: black; background-color: #00ff00; margin: 0; border-radius: 5px; text-align:center">{{ "Between 100K and < 500K" }}</p></b>

{% else %}
      <b><p style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ "Less than 100K" }}</p></b>
{% endif %}
    ;;
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
