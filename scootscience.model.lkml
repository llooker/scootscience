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
  # # I have a question about the join below--it seems like activity.id shoud be joined to instantpoint
  # # rather than activitytype_id.  check on this.
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
  join: stoqs_simpledepthtime {
    relationship: one_to_many
    sql_on: ${stoqs_activity.id} = ${stoqs_simpledepthtime.activity_id} ;;
  }
  join: stoqs_nominallocation {
    relationship: many_to_one
    sql_on: ${stoqs_activity.id} = ${stoqs_nominallocation.activity_id} ;;
  }
  # # STOQs documents say simple bottom depth time is "a simplified time series of bottom depth values for an Activity useful
  # # for plotting in the UI" Also, I used from bc the simple bottom depth time joins to several tables
  join: stoqs_simplebottomdepthtime {
    relationship: one_to_many
    sql_on: ${stoqs_activity.id} = ${stoqs_simplebottomdepthtime.activity_id} ;;
  }
  join: stoqs_simplebottomdepthtime_to_instantpoint {
    from: stoqs_simplebottomdepthtime
    relationship: one_to_many
    sql_on: ${stoqs_instantpoint.id} = ${stoqs_simplebottomdepthtime.instantpoint_id} ;;
  }
  join: stoqs_simplebottomdepthtime_to_nominallocation {
    from: stoqs_simplebottomdepthtime
    relationship: one_to_many
    sql_on: ${stoqs_nominallocation.id} = ${stoqs_simplebottomdepthtime.nominallocation_id} ;;
  }
  join: stoqs_simpledepthtime_to_nominallocation {
    from: stoqs_simpledepthtime
    relationship: one_to_many
    sql_on: ${stoqs_simpledepthtime.nominallocation_id} = ${stoqs_nominallocation.id} ;;
  }
  join: stoqs_simpledepthtime_to_instantpoint {
    from: stoqs_simpledepthtime
    relationship: one_to_many
    sql_on: ${stoqs_simpledepthtime.instantpoint_id} = ${stoqs_instantpoint.id} ;;
  }
  join: stoqs_nominallocation_to_measurement {
    from: stoqs_nominallocation
    relationship: one_to_one
    sql_on: ${stoqs_nominallocation.id} = ${stoqs_measurement.nominallocation_id};;
  }
  # # having trouble with the joins below--should be resourcetype to resource, but resource view not available for some reason
   join: stoqs_resourcetype {
   relationship: one_to_one
   sql_on: ${stoqs_resourcetype.id} = ${stoqs_resource.id} ;;
  }
   # STOQs ducmentation says this next join should be many_to_many but having similar problems here...
  join: stoqs_resource {
  relationship: many_to_many
  sql_on: ${stoqs_parameterresource.id} = ${stoqs_resource.id} ;;
  }
  join: stoqs_parameterresource {
    relationship: many_to_many
    sql_on: ${stoqs_parameterresource.parameter_id}=${stoqs_parameter.id} ;;
  }
  # #join: stoqs_analysismethod {
  # #  relationship: one_to_many
  # # sql_on: ${stoqs_analysismethod.id} = ${stoqs_sampledparameter};;
  # #}
}
