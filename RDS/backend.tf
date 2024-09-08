terraform {
  backend "s3" {
    bucket = "tf-backend1234"
    key    = "terraform/backend/tfstate"
    region = "us-west-1"
 }
}
