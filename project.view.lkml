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
    ##  url: "https://e247c1.pipegears.io/projects"  # Replace [yourlink]
      url: "https://hooks.zapier.com/hooks/catch/6674471/ombtdxc/"
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
        value: "{{ project.sfdc_id._value }}"
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

  dimension: sfdc_id {
    type: string
    label: "SFDC ID"
    sql: ${TABLE}.SFDC_ID ;;
  }

  dimension: next_steps {
    type: string
    label: "Next Steps"
    sql: ${TABLE}.NextSteps ;;
    action: {
      label: "Append to Next Step Notes"
      ##  url: "https://e247c1.pipegears.io/projects"  # Replace [yourlink]
      url: "https://hooks.zapier.com/hooks/catch/6674471/ombtdxc/"
      param: {
        name: "auth_code"
        value: "abc123456"
      }
      user_attribute_param: {
        user_attribute: id
        name: "user_id"
      }
      param: {
        name: "next_steps"
        value: "{{ value }}"
      }
      param: {
        name: "project_id"
        value: "{{ project.sfdc_id._value }}"
      }
      param: {
        name: "append_next_steps"
        value: "{{ project.next_steps._value }}"
      }
      form_param: {
        label: "Add to Next Step Notes"
        name: "add_next_steps"
        type: string
        required: no
      }
    }
  }

  dimension: project_status {
    label: "Project Status Emoji"
    sql: CASE WHEN substring(${next_steps},1,1) = 'G' THEN '🟢'
        WHEN substring(${next_steps},1,1) = 'R' THEN '🔴'
        WHEN substring(${next_steps},1,1) = 'Y' THEN '🟡'
        ELSE '' END;;
  }

  measure: count {
    type: count
    drill_fields: [project_name]
  }

  dimension: status_color {
    type: string
    label: "Project Status Color "
    sql: substring(${next_steps},1,1);;
    html:
        {% if value == 'R' %}
         <p style="background-color:red; color:red">{{ value }}</p>
        {% elsif value == 'Y' %}
         <p style="background-color:yellow; color:yellow">{{ value }}</p>
        {% else %}
         <p style="background-color:green; color:green">{{ value }}</p>
        {% endif %};;
  }


  dimension: status_letter {
    type: string
    label: "Project Status Letter"
    sql: substring(${next_steps},1,1);;
    html:
       {% if value == 'R'{{rendered_value}} %}
         <p style="color: red; font-size: 100%">{{ value }}</p>
       {% elsif value == 'Y' %}
         <p style="color: #FFA533; font-size:100%">{{ value }}</p>
       {% else %}
         <p style="color: green; font-size:100%">{{ value }}</p>
       {% endif %};;
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
