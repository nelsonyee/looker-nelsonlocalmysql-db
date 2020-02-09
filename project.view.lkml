view: project {
  sql_table_name: ProServices.Project ;;

  dimension: em {
    type: number
    hidden: yes
    sql: ${TABLE}.EM ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }

  dimension: hours_remaining {
    type: number
    sql: ${TABLE}.HoursRemaining ;;
  }

  dimension: id_project {
    primary_key: yes
    type: number
    sql: ${TABLE}.idProject ;;
  }

  dimension: percent_complete {
    type: number
    sql: ${TABLE}.PercentComplete ;;
    value_format: "0\%"
  }

  dimension: planned_hours {
    type: number
    sql: ${TABLE}.PlannedHours ;;
  }

  dimension: primary_analyst {
    type: number
    hidden: yes
    sql: ${TABLE}.PrimaryAnalyst ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "Salesforce"
      url: "https://looker.my.salesforce.com/{{ account.salesforce_account_id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.salesforce.com"
    }
    link: {
      label: "Company Website"
      url: "https://{{ account.website._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.salesforce.com"
    }
  }


  dimension: project_name {
    type: string
    sql: ${TABLE}.ProjectName ;;
    action: {
      label: "Update Project Name"
      url: "https://e247c1.pipegears.io/projects"  # Replace [yourlink]
      param: {
        name: "auth_code"
        value: "abc123456"
      }
      user_attribute_param: {
        user_attribute: id
        name: "user_id"
      }
      param: {
        name: "project_name"
        value: "{{ value }}"
      }
      param: {
        name: "project_id"
        value: "{{ project.id_project._value }}"
      }
      form_param: {
        label: "New Project Name"
        name: "new_project_name"
        type: string
        required: no
      }
    }
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartDate ;;
  }

  dimension: total_billable_hours {
    type: number
    sql: ${TABLE}.TotalBillableHours ;;
  }

  measure: count {
    type: count
    drill_fields: [project_name]
  }

  measure: project_duration {
    type: number
    label: "Project Duration"
    sql: datediff (${end_date},${start_date}) ;;
  }
  set: project_name {
    fields: [project_name, start_date, end_date, percent_complete]

  }
}
