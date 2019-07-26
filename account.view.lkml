view: account {
  sql_table_name: ProServices.Account ;;

  dimension: salesforce_account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.SalesforceAccountId ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.AccountName ;;
    link: {
      label: "Salesforce"
      url: "https://looker.my.salesforce.com/{{ salesforce_account_id }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.salesforce.com"
    }
  }

  dimension: id_account {
    type: number
    sql: ${TABLE}.idAccount ;;
  }

  dimension: account_region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.State ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.Website ;;
  }

  measure: count {
    type: count
    drill_fields: [salesforce_account_id, account_name]
  }
}
