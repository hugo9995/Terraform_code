provider "aws" {
  region = "us-west-1"
  #access_key	="AKIAJ4SKC5ZZXDDYYYYY"
  #secret_key	="HUCyvJiYmaVOYYYYYYYY"
}

resource "aws_instance" "first_ec2" {
  ami           = "ami-09d9c5cdcfb8fc655"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "terraform_ec2"
  }
}
