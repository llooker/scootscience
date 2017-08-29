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
}
