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
    sql: 1.0*${TABLE}.datavalue ;;
  }

  dimension: measurement_id {
    type: number
    sql: ${TABLE}.measurement_id ;;
  }

  dimension: parameter_id {
    type: number
    sql: ${TABLE}.parameter_id ;;
  }
  measure: total_datavalue {
    type: sum
    sql: ${datavalue} ;;
  }
  measure: salanity {
    type: average
    sql: ${datavalue} ;;
    filters: {
      field:stoqs_parameter.standard_name
      value: "sea_water_salinity"
    }
  }
  measure:  sea_water_temperature {
    type: average
    sql: ${datavalue} ;;
    filters: {
      field:stoqs_parameter.standard_name
      value: "sea_water_temperature"
    }
  }



  measure: count {
    type: count
    drill_fields: [id]
  }
}
