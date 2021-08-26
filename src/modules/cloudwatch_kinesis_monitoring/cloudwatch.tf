resource "aws_cloudwatch_metric_alarm" "kinesis_iterator_age" {
  alarm_name          = "${var.app_name}_high_iterator_age"
  namespace           = "AWS/Kinesis"
  metric_name         = "GetRecords.IteratorAgeMilliseconds"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.kinesis_iterator_age_error_threshold}"
  evaluation_periods  = "${var.kinesis_iterator_age_error_evaluation_periods}"
  period              = "${var.kinesis_iterator_age_error_period}"
  alarm_description   = "Kinesis High Iterator Age: ${var.app_name}"

  alarm_actions      = ["${var.alarm_action_arn}"]
  ok_actions         = ["${var.ok_action_arn}"]
  treat_missing_data = "notBreaching"

  dimensions {
    StreamName = "${var.app_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "kinesis_write_exceeded" {
  alarm_name          = "${var.app_name}_write_exceeded"
  namespace           = "AWS/Kinesis"
  metric_name         = "WriteProvisionedThroughputExceeded"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "${var.kinesis_write_throughput_exceeded_threshold}"
  evaluation_periods  = "${var.kinesis_write_throughput_exceeded_evaluation_periods}"
  period              = "${var.kinesis_write_throughput_exceeded_period}"
  alarm_description   = "Kinesis Write Throughput Exceeded: ${var.app_name}"

  alarm_actions      = ["${var.alarm_action_arn}"]
  ok_actions         = ["${var.ok_action_arn}"]
  treat_missing_data = "notBreaching"

  dimensions {
    StreamName = "${var.app_name}"
  }

  count = "${var.kinesis_write_exceeded_enabled ? 1 : 0}"
}
