provider "aws" {
	region		="us-west-1"
	#access_key	="AKIMA4SKC5ZZXDDYYYYY"
	#secret_key	="HUCyMviYmaVOYYYYYYYY"
}

resource "aws_instance" "hahtech_ec2" {
	ami		="ami-09d9c5cdcfb8fc655"
	instance_type	="t2.micro"
	key_name	="devops_automation"
	security_groups	=["devops-automation"]	
	
	tags = {
		Name		="public_ip_demo_ec2"
		Environment	="dev"
		Area		="DevOps Infra"
	}
}
