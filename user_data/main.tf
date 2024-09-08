provider "aws" {
	region		="us-west-1"
}
resource "aws_s3_bucket" "first_bucket" {
	bucket		="hahtech-bucket-9956"
	
	tags = {
		Name		="terraform_bucket"
		Environment	="dev"
	}
}

resource "aws_instance" "hahtech_ec2" {
	#RHEL8
	#ami		="ami-09d9c5cdcfb8fc655"
	#Amazon Linux
	ami		="ami-0a8a24772b8f01294"
	instance_type	="t2.micro"
	key_name	="devops_automation"
	security_groups	=["devops-automation"]	

	user_data = <<EOF
#!/bin/bash
yum -y update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Terraform Automation: Page was created by the user data in a EC2</h1>" > /var/www/html/index.html
EOF	
	
	tags = {
		Name		="user_data_ec2"
		Environment	="dev"
		Area		="DevOps Infra"
	}
}
