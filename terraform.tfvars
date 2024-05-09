policy-name = "workflow(slack)-policy"
email_destination = {
  name = "email-destination"
  type = "EMAIL"
  
  key   = "email"
  value = "himanshisoni2805@gmail.com"

}
notification = {
  0 = {
    name           = "slack-notification-channel"
    type           = "SLACK"
    product        = "IINT"
    destination_id = ""

    key   = "channelId"
    value = "C071X6N905A"

  },
  1 = {
    name           = "email-notification-channel"
    type           = "EMAIL"
    product        = "IINT"
    destination_id = "4896359c-3360-494f-a412-31d0d5845e67"
    key            = "email"
    value          = "himanshisoni2805@gmail.com"
  }
}
workflow = {
  name                  = "Multiple Destination(DATA block)"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  #   issues_filter = {
  name1 = "Filter-name"
  type  = "FILTER"

  # predicate = {
  attribute = "labels.policyIds"
  operator  = "EXACTLY_MATCHES"
  # }
  #   }

  #   destination = {
  # notification_triggers = ["ACTIVATED"]
  #   }
}