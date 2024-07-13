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
	#access_key	="LKAKIOA4SKC5ZZXDDYYYYY"
	#secret_key	="LHKUCyOviYmaVOYYYYYYYY"
}

resource "aws_dynamodb_table" "basic-table-hahtech" {
  name           = "hahtech_dynamo_table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key = "table_demo_id"

  attribute {
    name = "table_demo_id"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "Sample Table"
    Environment = "Test"
  }
}
