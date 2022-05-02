FROM tomcat:9-jdk11
ADD target/ParkinglotApplication.war /usr/local/tomcat/webapps/ParkinglotApplication.war
EXPOSE 8080
CMD ["catalina.sh","run"]