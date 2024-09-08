#!/bin/bash
export iSQ_VERSION=10.0.0.68432
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SQ_VERSION}.zip
sudo unzip sonarqube-${SQ_VERSION}.zip
sudo mv sonarqube-${SQ_VERSION} /opt/sonarqube
sudo groupadd sonar
sudo useradd -d /opt/sonarqube -g sonar sonar
sudo chown sonar:sonar /opt/sonarqube -R
#Configure RAM requirements
sudo sed -i 's/#sonar.web.javaOpts/sonar.web.javaOpts/' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's/#sonar.ce.javaOpts/sonar.ce.javaOpts/' /opt/sonarqube/conf/sonar.properties

#Configiure DB
#sudo sed -i 's/#sonar.jdbc.username=/sonar.jdbc.username=sonar/' /opt/sonarqube/conf/sonar.properties
#sudo sed -i 's/#sonar.jdbc.password=/sonar.jdbc.password=5trongP4ssword/' /opt/sonarqube/conf/sonar.properties
#sudo sed -i 's_#----- Embedded Database (default)_sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube_' /opt/sonarqube/conf/sonar.properties

#Configure user
#sudo sed -i 's/#RUN_AS_USER=/RUN_AS_USER=sonar/' /opt/sonarqube/bin/linux-x86-64/sonar.sh

#Start SQ
sudo -u sonar  bash -c "/opt/sonarqube/bin/linux-x86-64/sonar.sh start"

