provider "aws" {
	region		="us-west-1"
	#access_key	="AKIA4SMKC5ZZXDDYYYYY"
	#secret_key	="HUCyviYMmaVOYYYYYYYY"
}

resource "aws_s3_bucket" "first_bucket" {
	bucket		="hahtech-bucket-9956"
	
	tags = {
		Name		="terraform_bucket"
		Environment	="dev"
	}
}
