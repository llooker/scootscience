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
    sql_on: ${stoqs_measuredparameter.parameter_id} = ${stoqs_parameter.id} ;;
  }
  join: stoqs_measurement {
    relationship: many_to_one
    sql_on: ${stoqs_measuredparameter.measurement_id}= ${stoqs_measurement.id} ;;
  }
  join: stoqs_instantpoint {
    #view_label: "Stoqs Measurement"
    relationship: many_to_one
    sql_on: ${stoqs_instantpoint.id} = ${stoqs_measurement.instantpoint_id} ;;
  }
  join: stoqs_activity {
    relationship: one_to_many
    sql_on: ${stoqs_activity.activitytype_id} = ${stoqs_instantpoint.activity_id} ;;
  }
  join: stoqs_platform {
    relationship: many_to_one
    # this was the original code sql_on: ${stoqs_platform.platformtype_id} = ${stoqs_activity.platform_id} ;;
    # but I changed it to the code on the line below - JPL
    sql_on: ${stoqs_platform.id} = ${stoqs_activity.platform_id};;
  }
  # # this is my first attempt at editing the looker model JPL
  join: stoqs_platformtype {
    relationship: one_to_one
    sql_on: ${stoqs_platform.platformtype_id} = ${stoqs_platformtype.id} ;;
  }
  join: stoqs_activitytype {
    relationship: one_to_one
    sql_on: ${stoqs_activity.activitytype_id} = ${stoqs_activitytype.id} ;;
  }
  join: stoqs_campaign {
    relationship: one_to_many
    sql_on: ${stoqs_campaign.id} = ${stoqs_activity.campaign_id} ;;
  }
  # # I tried the planneddepthtime join in the explore and it seems like the table might be empty.
  # # not really sure what it is for.  The STOQs documentation says " simplified time series of depth values for an activity, useful for plotting in the UI"
  join: stoqs_planneddepthtime{
    relationship: many_to_one
    sql_on: ${stoqs_planneddepthtime.activity_id} = ${stoqs_activity.id} ;;
  }

}
