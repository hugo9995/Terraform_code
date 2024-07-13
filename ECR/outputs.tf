output "ecr_url" {
  description = "The ECR URL."
  value       = try(aws_ecr_repository.hah_tech_block.repository_url, "")
}

