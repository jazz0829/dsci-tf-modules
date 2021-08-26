variable "region" {
  default = "eu-west-1"
}

variable "app_name" {}

variable "project" {}

variable "environment" {}

variable "kinesis_iterator_age_error_threshold" {
  default = "600000"
}

variable "kinesis_iterator_age_error_evaluation_periods" {
  default = "1"
}

variable "kinesis_iterator_age_error_period" {
  default = "300"
}

variable "kinesis_write_throughput_exceeded_threshold" {
  default = "1"
}

variable "kinesis_write_throughput_exceeded_evaluation_periods" {
  default = "1"
}

variable "kinesis_write_throughput_exceeded_period" {
  default = "300"
}

variable "alarm_action_arn" {}

variable "ok_action_arn" {}

variable "kinesis_write_exceeded_enabled" {
  default     = false
  description = "Enable kinesis_write_exceeded alarm"
}
