view: stoqs_sampledparameter {
  sql_table_name: public.stoqs_sampledparameter ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: analysismethod_id {
    type: number
    sql: ${TABLE}.analysismethod_id ;;
  }

  dimension: datavalue {
    type: number
    sql: ${TABLE}.datavalue ;;
  }

  dimension: parameter_id {
    type: number
    sql: ${TABLE}.parameter_id ;;
  }

  dimension: sample_id {
    type: number
    sql: ${TABLE}.sample_id ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
