- dashboard: us_west_active_projects
  title: Us West Active Projects

  layout: newspaper
  elements:
  - name: US West Projects with SF consultants
    title: US West Projects with SF consultants
    model: nelsonmysql
    explore: project
    type: table
    fields: [consultant.first_name, consultant.last_name, project.project_name]
    filters:
      consultant.last_name: Carnes,Samudzi
    sorts: [consultant.first_name]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen:
      Start Date in 2019: project.start_year
    row: 0
    col: 1
    width: 10
    height: 3
  - name: US West Projects
    title: US West Projects
    model: nelsonmysql
    explore: project
    type: table
    fields: [project.project_name, project.customer, consultant.first_name, consultant.last_name,
      consultant.company]
    sorts: [project.project_name]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Start Date in 2019: project.start_year
    row: 3
    col: 1
    width: 15
    height: 11
  - name: Tree Map
    title: Tree Map
    model: nelsonmysql
    explore: project
    type: treemap
    fields: [consultant.last_name, project.count]
    filters:
      project.start_date: '2019'
    sorts: [project.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 0
    col: 16
    width: 8
    height: 6
  filters:
  - name: Start Date in 2019
    title: Start Date in 2019
    type: field_filter
    default_value: '2019'
    allow_multiple_values: true
    required: false
    model: nelsonmysql
    explore: project
    listens_to_filters: []
    field: project.start_year


