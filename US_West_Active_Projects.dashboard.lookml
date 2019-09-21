- dashboard: active_us_west_projects
  title: Active US West Projects
  label: Active US West Projects
  layout: newspaper
  refresh: 1 hour
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
    column_limit: 50
    query_timezone: America/Los_Angeles
    series_types: {}
    refresh: 1 hour
    listen:
      Start Date in 2019: project.start_year
    row: 0
    col: 1
    width: 9
    height: 2
  - name: Tree Map
    title: Tree Map
    label: Tree Map
    model: nelsonmysql
    explore: project
    type: treemap
    fields: [consultant.last_name, project.count]
    sorts: [project.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    refresh: 1 hour
    listen:
      Start Date in 2019: project.start_year
    row: 0
    col: 10
    width: 12
    height: 5
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
    refresh: 1 hour
    listen:
      Start Date in 2019: project.start_year
    row: 5
    col: 1
    width: 15
    height: 11
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
