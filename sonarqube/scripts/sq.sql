ALTER USER sonar WITH ENCRYPTED password '5trongP4ssword';
CREATE DATABASE sonarqube OWNER sonar;
GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;
