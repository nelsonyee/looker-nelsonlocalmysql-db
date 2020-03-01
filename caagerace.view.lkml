view: caagerace {
  sql_table_name: ProServices.caagerace ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: county_name {
    label: "County"
    type: string
    sql: ${TABLE}.CountyName ;;
  }

  dimension: race_name {
    label: "Race"
    type: string
    sql: ${TABLE}.RaceName ;;
  }

  dimension: pop2000 {
    type: number
    sql: ${TABLE}.Pop2000 ;;
  }

  dimension: pop2001 {
    type: number
    sql: ${TABLE}.Pop2001 ;;
  }

  dimension: pop2002 {
    type: number
    sql: ${TABLE}.Pop2002 ;;
  }

  dimension: pop2003 {
    type: number
    sql: ${TABLE}.Pop2003 ;;
  }

  dimension: pop2004 {
    type: number
    sql: ${TABLE}.Pop2004 ;;
  }

  dimension: pop2005 {
    type: number
    sql: ${TABLE}.Pop2005 ;;
  }

  dimension: pop2006 {
    type: number
    sql: ${TABLE}.Pop2006 ;;
  }

  dimension: pop2007 {
    type: number
    sql: ${TABLE}.Pop2007 ;;
  }

  dimension: pop2008 {
    type: number
    sql: ${TABLE}.Pop2008 ;;
  }

  dimension: pop2009 {
    type: number
    sql: ${TABLE}.Pop2009 ;;
  }

  dimension: pop2010 {
    type: number
    sql: ${TABLE}.Pop2010 ;;
  }

  measure: sum_pop2000 {
    type: sum
    sql: ${pop2000} ;;
    drill_fields: [county_name, race_name, sum_pop2000]
  }

  measure: sum_pop2001 {
    type: sum
    sql: ${pop2001} ;;
    drill_fields: [county_name, race_name, sum_pop2001]
  }

  measure: sum_pop2002 {
    type: sum
    sql: ${pop2002} ;;
    drill_fields: [county_name, race_name, sum_pop2002]
  }

  measure: sum_pop2003 {
    type: sum
    sql: ${pop2003} ;;
    drill_fields: [county_name, race_name, sum_pop2003]
  }

  measure: sum_pop2004 {
    type: sum
    sql: ${pop2004} ;;
    drill_fields: [county_name, race_name, sum_pop2004]
  }

  measure: sum_pop2005 {
    type: sum
    sql: ${pop2005} ;;
    drill_fields: [county_name, race_name, sum_pop2005]
  }

  measure: sum_pop2006 {
    type: sum
    sql: ${pop2006} ;;
    drill_fields: [county_name, race_name, sum_pop2006]
  }

  measure: sum_pop2007 {
    type: sum
    sql: ${pop2007} ;;
    drill_fields: [county_name, race_name, sum_pop2007]
  }

  measure: sum_pop2008 {
    type: sum
    sql: ${pop2008} ;;
    drill_fields: [county_name, race_name, sum_pop2008]
  }

  measure: sum_pop2009 {
    type: sum
    sql: ${pop2009} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
  }

  measure: sum_pop2010 {
    type: sum
    sql: ${pop2010} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
    html: <font size="+2">{{linked_value}}</font>;;
  }

  measure: sum_pop2010_pre_baby_boomers {
    type: sum
    label: "Pre-Baby Boomers 2010"
    filters: {
      field: caagerace.age
      value: ">=67"
    }
    sql: ${pop2010} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
  }

  measure: sum_pop2010_baby_boomers {
    type: sum
    label: "Baby Boomers 2010"
    filters: {
      field: caagerace.age
      value: ">=46 AND <=66"
    }
    sql: ${pop2010} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
  }

  measure: sum_pop2010_gen_x {
    type: sum
    label: "Gen X Population 2010"
    filters: {
      field: caagerace.age
      value: ">=31 AND <=45"
    }
    sql: ${pop2010} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
  }

  measure: sum_pop2010_gen_y {
    type: sum
    label: "Gen Y Population 2010"
    filters: {
      field: caagerace.age
      value: ">=16 AND <=30"
    }
    sql: ${pop2010} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
  }

  measure: sum_pop2010_gen_z {
    type: sum
    label: "Gen Z Population 2010"
    filters: {
      field: caagerace.age
      value: ">=0 AND <=15"
    }
    sql: ${pop2010} ;;
    drill_fields: [county_name, race_name, sum_pop2010]
  }

  measure: count {
    type: count
    drill_fields: [county_name, race_name]
    hidden: yes
  }
}
