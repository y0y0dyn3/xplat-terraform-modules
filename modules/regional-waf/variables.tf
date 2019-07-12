variable "stage" {
    type    = "string"
    default = ""
}
variable "region" {
    type    = "string"
    default = ""
}
variable "acl_association_resource_arn" {
    type    = "string"
    default = ""
}
variable "api_name" {
    type    = "string"
    default = ""
}
# Valid values are BLOCK or ALLOW
# The correct setting is almost always ALLOW.
variable "web_acl_default_action" {
    type    = "string"
    default = "ALLOW"
}

# Valid values are BLOCK, ALLOW, COUNT.
# BLOCK will typically be the correct production value.
# The default value is set to COUNT so that a rule action of BLOCK or ALLOW 
# is an intentional decision. 

variable "ip_blacklist_default_action" {
    type    = "string"
    default = "COUNT"
}

variable "rate_ip_throttle_default_action" {
    type    = "string"
    default = "COUNT"
}

variable "xss_match_rule_default_action" {
    type    = "string"
    default = "COUNT"
}

variable "byte_match_traversal_default_action" {
    type    = "string"
    default = "COUNT"
}

variable "byte_match_webroot_default_action" {
    type    = "string"
    default = "COUNT"
}

variable "sql_injection_default_action" {
    type    = "string"
    default = "COUNT"
}

# Requests per 5 Minutes.
variable "rate_ip_throttle_limit" {
    type    = "string"
    default = 5000
}
