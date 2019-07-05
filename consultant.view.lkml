view: consultant {
  label: "Consultant"
  sql_table_name: ProServices.Consultant ;;

  dimension: first_name {
    type: string
    label: "First Name"
    sql: ${TABLE}.FirstName ;;
  }

  dimension: id_consultant {
    primary_key: yes
    label: "Id"
    type: number
    sql: ${TABLE}.idConsultant ;;
  }

  dimension: last_name {
    type: string
    label: "Last Name"
    sql: ${TABLE}.LastName ;;
  }

  dimension: partner_flag {
    type: string
    sql: ${TABLE}.PartnerFlag ;;
  }

  dimension: company {
    type: string
    label: "Company"
    sql: ${TABLE}.Company ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
