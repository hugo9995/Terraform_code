terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
        region          ="us-west-1"
        #access_key     ="AKIMA4SKC5ZZXDDYYYYY"
        #secret_key     ="HUCyMviYmaVOYYYYYYYY"
}

