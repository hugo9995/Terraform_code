#!/bin/bash
#Run all as ec2-user user
sudo yum install -y postgresql15 postgresql15-contrib postgresql15-server
sudo postgresql-setup initdb
sudo systemctl enable postgresql
#Enable remote access
sudo sed -i "s/# - Connection Settings -/listen_addresses = '*'/" /var/lib/pgsql/data/postgresql.conf
echo "host	all		all		0.0.0.0/0		md5" > /var/lib/pgsql/data/remote_access.conf
cat /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/remote_access.conf > /var/lib/pgsql/data/pg_hba.conf.remote
rm -fr /var/lib/pgsql/data/pg_hba.conf && mv /var/lib/pgsql/data/pg_hba.conf.remote /var/lib/pgsql/data/pg_hba.conf
sudo systemctl start postgresql
#Clean tmp files
rm -fr /var/lib/pgsql/data/remote_access.conf
#Create a DB and user to connect
echo strongPassword123 | sudo passwd postgres --stdin
sudo -u postgres bash -c "createuser sonar"
sudo -H -u postgres psql -c "ALTER USER sonar WITH ENCRYPTED password '5trongP4ssword';" -c 'CREATE DATABASE sonarqube OWNER sonar;' -c 'GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;'
