resource "aws_ecr_repository" "hah_tech_block" {
  name                 = "hah_tech_repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    env = "dev",
    name = "HAH Tech Repository"
  }
}
