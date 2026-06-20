# SNS Topic
resource "aws_sns_topic" "cloudwatch_alerts" {
  name = "cloudwatch-alerts-topic"
}

# Email Subscription
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.cloudwatch_alerts.arn
  protocol  = "email"
  endpoint  = "nagarinishitha03@gmail.com" # Replace with your email
}

# EC2 Instance


# CloudWatch CPU Alarm
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 4

  alarm_description = "Alarm when CPU exceeds 70%"

  dimensions = {
    InstanceId = "i-04706b23f8a4b7d7c"
  }

  alarm_actions = [
    aws_sns_topic.cloudwatch_alerts.arn
  ]
}