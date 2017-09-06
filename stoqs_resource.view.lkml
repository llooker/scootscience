view: stoqs_resource {
  sql_table_name: public.stoqs_resource ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: resourcetype_id {
    type: number
    sql: ${TABLE}.resourcetype_id ;;
  }

  dimension: uristring {
    type: string
    sql: ${TABLE}.uristring ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
