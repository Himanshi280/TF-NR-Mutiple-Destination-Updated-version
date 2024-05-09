resource "newrelic_alert_policy" "policy" {
  name = var.policy-name
}

resource "newrelic_notification_destination" "email_destination" {
  name = var.email_destination.name
  type = var.email_destination.type

  property {
    key   = var.email_destination.key
    value = var.email_destination.value
  }
}

data "newrelic_notification_destination" "slack_destination" {
  name = "xyz"
}
resource "newrelic_notification_channel" "notify-channel" {
  for_each       = var.notification
  name           = each.value.name
  type           = each.value.type
  destination_id = each.value.destination_id==""?"${data.newrelic_notification_destination.slack_destination.id}":each.value.destination_id
 
  product        = each.value.product

  property {
    key   = each.value.key
    value = each.value.value
  }


}
# resource "newrelic_notification_channel" "notify-channel" {

#   name           = var.notification.name
#   type           = var.notification.type
#   destination_id = data.newrelic_notification_destination.slack_destination.id
#   product        = var.notification.product

#   property {
#     key   = var.notification.key
#     value = var.notification.value
#   }}



resource "newrelic_workflow" "workflow" {
  name                  = var.workflow.name
  muting_rules_handling = var.workflow.muting_rules_handling

  issues_filter {
    name = var.workflow.name1
    type = var.workflow.type

    predicate {
      attribute = var.workflow.attribute
      operator  = var.workflow.operator
      values    = [newrelic_alert_policy.policy.id]
    }
  }

  # destination {
  #   channel_id            = newrelic_notification_channel.notify-channel[0].id
  #   notification_triggers = var.workflow.notification_triggers
  # }

  #  destination {
  #   channel_id            = newrelic_notification_channel.notify-channel[1].id
  #   notification_triggers = var.workflow.notification_triggers
  # }
  dynamic "destination" {
    for_each = newrelic_notification_channel.notify-channel
    content {
      channel_id = destination.value.id
    }
  }
}