view: stoqs_activity {
  sql_table_name: public.stoqs_activity ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activitytype_id {
    type: number
    sql: ${TABLE}.activitytype_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension_group: enddate {
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
    sql: ${TABLE}.enddate ;;
  }

  dimension_group: loaded {
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
    sql: ${TABLE}.loaded_date ;;
  }

  dimension: mappoint {
    type: string
    sql: ${TABLE}.mappoint ;;
  }

  dimension: maptrack {
    type: string
    sql: ${TABLE}.maptrack ;;
  }

  dimension: maxdepth {
    type: number
    sql: ${TABLE}.maxdepth ;;
  }

  dimension: mindepth {
    type: number
    sql: ${TABLE}.mindepth ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_measuredparameters {
    type: number
    sql: ${TABLE}.num_measuredparameters ;;
  }

  dimension_group: plannedenddate {
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
    sql: ${TABLE}.plannedenddate ;;
  }

  dimension_group: plannedstartdate {
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
    sql: ${TABLE}.plannedstartdate ;;
  }

  dimension: plannedtrack {
    type: string
    sql: ${TABLE}.plannedtrack ;;
  }

  dimension: platform_id {
    type: number
    sql: ${TABLE}.platform_id ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}.startdate ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
