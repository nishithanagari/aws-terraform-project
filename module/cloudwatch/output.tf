output "instance_id" {
  value = aws_instance.cloudwatch_server.id
}

output "public_ip" {
  value = aws_instance.cloudwatch_server.public_ip
}

output "sns_topic_arn" {
  value = aws_sns_topic.cloudwatch_alerts.arn
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}