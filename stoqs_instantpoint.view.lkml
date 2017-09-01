view: stoqs_instantpoint {
  sql_table_name: public.stoqs_instantpoint ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activity_id {
    hidden: yes
    type: number
    sql: ${TABLE}.activity_id ;;
  }

  dimension_group: timevalue {
    description: "This field comes from Instantpoint Table"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timevalue ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
