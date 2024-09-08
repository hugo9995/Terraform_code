#!/bin/bash
yum -y update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Terraform Automation: Page was created by the user data from a file in a EC2</h1>" > /var/www/html/index.html

