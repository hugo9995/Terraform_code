terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
	region		="us-west-1"
	#access_key	="AKiMIA4SKC5ZZXDDYYYYY"
	#secret_key	="HUCyMviYmaVOYYYYYYYY"
}

resource "aws_instance" "hahtech_ec2" {
	#RHEL8
	#ami		="ami-09d9c5cdcfb8fc655"
	#Amazon Linix
	ami		="ami-0a8a24772b8f01294"
	instance_type	="t2.micro"
	key_name	="devops_automation"
	security_groups	=["devops-automation"]	

	user_data = "${file("install_apache.sh")}"	
	
	tags = {
		Name		="user_data_with_file_ec2"
		Environment	="dev"
		Area		="DevOps Infra"
	}
}
