view: stoqs_planneddepthtime {
  sql_table_name: public.stoqs_planneddepthtime ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activity_id {
    type: number
    sql: ${TABLE}.activity_id ;;
  }

  dimension: depth {
    type: number
    sql: ${TABLE}.depth ;;
  }

  dimension: epochmilliseconds {
    type: number
    sql: ${TABLE}.epochmilliseconds ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
