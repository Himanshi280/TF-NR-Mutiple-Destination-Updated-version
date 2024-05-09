variable "policy-name" {
  type = string
}
variable "email_destination" {
  type = object({
    name = string
    type = string

    key   = string
    value = string

  })
}
# variable "notification" {
#   type = object({
#     name           = string
#     type           = string
#     destination_id = any
#     product        = string
#     key            = string
#     value          = string
#   })
# }
# variable "workflow" {
#   type = object({
#     name                  = string
#     muting_rules_handling = string
#     name1                  = string
#     type                  = string
#     attribute             = string
#     operator              = string
#     notification_triggers = set(string)
#   })
# }
variable "workflow" {
  type = any
}
variable "notification" {
  type = any
}