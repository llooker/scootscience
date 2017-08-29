view: stoqs_measuredparameter {
  sql_table_name: public.stoqs_measuredparameter ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: dataarray {
    type: string
    sql: ${TABLE}.dataarray ;;
  }

  dimension: datavalue {
    type: number
    sql: ${TABLE}.datavalue ;;
  }

  dimension: measurement_id {
    type: number
    sql: ${TABLE}.measurement_id ;;
  }

  dimension: parameter_id {
    type: number
    sql: ${TABLE}.parameter_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
