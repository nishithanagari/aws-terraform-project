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
resource "aws_instance" "cloudwatch_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "CloudWatch-Server"
  }
}

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
    InstanceId = aws_instance.cloudwatch_server.id
  }

  alarm_actions = [
    aws_sns_topic.cloudwatch_alerts.arn
  ]
}