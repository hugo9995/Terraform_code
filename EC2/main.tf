terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
	region		="us-west-1"

}

resource "aws_security_group" "hah_sg" {
  name        = "hahchannel"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-94c814f2"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/16"]
  }

  egress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "hahchannel",
    Org = "Training"
  }
}

resource "aws_instance" "first_ec2" {
	ami		="ami-09d9c5cdcfb8fc655"
	instance_type	="t2.micro"
	key_name	="devops"

  #IAM
  iam_instance_profile = "test"  
   
  #Network
	vpc_security_group_ids = [aws_security_group.hah_sg.id]

  #Storage
  ebs_optimized = true
  root_block_device {
     encrypted     = true
  }

  #Monitoring
  monitoring = true

  metadata_options {
       http_endpoint = "enabled"
       http_tokens   = "required"
  }
	
	tags = {
		Name	="terraform_ec2",
		Org	="Training"
	}
}
