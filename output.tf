output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.instance.instance_id
}

output "s3_bucket_name" {
  value = module.S3.s3_bucket_name
}

output "user_name" {
  value = module.IAM.user_name
}