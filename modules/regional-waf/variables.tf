variable "stage" {
    type = "string"
    default = ""
}
variable "region" {
    type = "string"
    default = ""
}
variable "api_gateway_arn" {
    type = "string"
    default = "arn:aws:apigateway:${var.region}::/restapis/${var.api_id}/stages/${var.stage}"
}
variable "api_name" {
    type = "string"
    default = ""
}


