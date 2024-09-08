output "public_dns" {
  description = "The public DNS name assigned to the instance."
  value       = try(aws_instance.hahtech_ec2.public_dns, "")
}
output "public_ip" {
  description = "The public IP address assigned to the instance"
  value       = try(aws_instance.hahtech_ec2.public_ip, "")
}

output "tags_all" {
  description = "A map of tags assigned to the resource"
  value       = try(aws_instance.hahtech_ec2.tags_all, {})
}
output "arn" {
  description = "The ARN of the instance"
  value       = try(aws_instance.hahtech_ec2.arn, "")
}
output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = try(aws_instance.hahtech_ec2.private_ip, "")
}
output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2"
  value       = try(aws_instance.hahtech_ec2.private_dns, "")
}

