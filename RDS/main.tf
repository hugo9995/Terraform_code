provider "aws" {
	region		="us-west-1"
	#access_key	="AKIA4SMKC5ZZXDDYYYYY"
	#secret_key	="HUCyviYMmaVOYYYYYYYY"
}

resource "aws_db_instance" "default" {
  #RDS name
  identifier	       = "hahtech-rds"
  #Storage
  allocated_storage    = 25
  storage_type	       = "gp2"
  #Engine
  engine               = "postgres"
  engine_version       = "15.4"
  #Family
  instance_class       = "db.t3.micro"
  #DB details
  db_name                 = "hah_tect_db"
  username             = "main"
  password             = "Secur3Pa55w0rd"
  skip_final_snapshot  = true
  #Tags
  tags = {
     Name            ="terraform_dev_rds"
     Environment     ="dev"
  }
}
