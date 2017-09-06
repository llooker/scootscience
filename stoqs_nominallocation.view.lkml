view: stoqs_nominallocation {
  sql_table_name: public.stoqs_nominallocation ;;

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

  dimension: geom {
    type: string
    sql: ${TABLE}.geom ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
