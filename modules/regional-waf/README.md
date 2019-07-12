# regional-waf

Network Hygiene for API Gateways and Application Load Balancers.


## Rules

### When adding new rules:

1. Always use a variable to define the action.
2. Always set the default value to "COUNT".  This prevents accidental blocks for users of this submodule.

### Special Notes

iplist_blacklist rule:  The rule is in place with no associated IPs. In an emergency, use the UI to add new IP sets. Clean up terraform if IP block becomes permanent.<br/>

Direct Link: https://console.aws.amazon.com/wafv2/home?region=us-east-1#/rules/detail/REGULAR/<br/>
Documentation: https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html



### SAMPLE USE

```
module "regional_waf" {
  source    = "github.com/rackerlabs/xplat-terraform-modules//modules/regional-waf"
  api_name  = "${var.service_name}"
  stage     = "${var.stage}"
  region    = "${var.region}"
  
  acl_association_resource_arn = "arn:aws:apigateway:${var.region}::/restapis/${module.device_service_api.api_id}/stages/${var.stage}"

  # Valid values are BLOCK or ALLOW
  # The correct setting is almost always ALLOW.
  # Default in variables.tf = ALLOW.
  web_acl_default_action = "ALLOW"

  # Valid values are BLOCK, ALLOW, COUNT.
  # BLOCK will typically be the correct production value.
  # Set to COUNT when introducing a new rule, until you 
  # are certain that rule is behaving as intended.
  # Default in variables.tf = COUNT.
  ip_blacklist_default_action         = "COUNT" # currently an empty set.  Use the UI to add new IPs in an emergency.
  rate_ip_throttle_default_action     = "COUNT"
  xss_match_rule_default_action       = "COUNT"
  byte_match_traversal_default_action = "COUNT"
  byte_match_webroot_default_action   = "COUNT"
  sql_injection_default_action        = "COUNT"

  # Requests per 5 minutes.  Default in variables.tf = 5000.
  rate_ip_throttle_limit = 2000
}
```
