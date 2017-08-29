view: stoqs_measurement {
  sql_table_name: public.stoqs_measurement ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bottomdepth {
    type: number
    sql: ${TABLE}.bottomdepth ;;
  }

  dimension: depth {
    type: number
    sql: ${TABLE}.depth ;;
  }

  dimension: geom {
    type: string
    sql: ${TABLE}.geom ;;
  }

  dimension: instantpoint_id {
    type: number
    sql: ${TABLE}.instantpoint_id ;;
  }

  dimension: nominallocation_id {
    type: number
    sql: ${TABLE}.nominallocation_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
