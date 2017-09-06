view: stoqs_simplebottomdepthtime {
  sql_table_name: public.stoqs_simplebottomdepthtime ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activity_id {
    type: number
    sql: ${TABLE}.activity_id ;;
  }

  dimension: bottomdepth {
    type: number
    sql: ${TABLE}.bottomdepth ;;
  }

  dimension: epochmilliseconds {
    type: number
    sql: ${TABLE}.epochmilliseconds ;;
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
