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
	ami		="ami-09c5c62bac0d0634e"
	instance_type	="t2.micro"
	key_name	="devops_automation"
	security_groups	=["devops-automation"]	

	user_data = "${file("inst_db.sh")}"	
	
	tags = {
		Name		="image with Postgres 15"
		Environment	="dev"
		Area		="DevOps IaC"
	}
}
