view: stoqs_parameterresource {
  sql_table_name: public.stoqs_parameterresource ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: parameter_id {
    type: number
    sql: ${TABLE}.parameter_id ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
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
