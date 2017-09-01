connection: "stoqs_initial"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: stoqs_measuredparameter {
  label: "scootscience_101"
  join: stoqs_parameter {
    relationship: many_to_one
    sql_on: ${stoqs_measuredparameter.id} = ${stoqs_parameter.id} ;;
  }
  join: stoqs_measurement {
    relationship: many_to_one
    sql_on: ${stoqs_measuredparameter.id} = ${stoqs_measuredparameter.id} ;;
  }
  join: stoqs_instantpoint {
    view_label: "Stoqs Measurement"
    relationship: one_to_one
    sql_on: ${stoqs_instantpoint.id} = ${stoqs_measurement.instantpoint_id} ;;
  }
  join: stoqs_activity {
    relationship: one_to_many
    sql_on: ${stoqs_activity.activitytype_id} = ${stoqs_instantpoint.activity_id} ;;
  }
  join: stoqs_platform {
    relationship: many_to_one
    sql_on: ${stoqs_platform.platformtype_id} = ${stoqs_activity.platform_id} ;;
  }
}
