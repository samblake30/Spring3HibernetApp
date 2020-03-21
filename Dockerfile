FROM alpine/git as clone
LABEL maintainer  "Ankit1.Sambhare@ril.com"
ENV http_proxy=http://10.159.0.3:8678 
ENV https_proxy=http://10.159.0.3:8678
WORKDIR /root/
RUN git clone https://github.com/opstree/OT-Java-WebApp.git

FROM maven:3.5-jdk-8-alpine  as Build
COPY --from=clone /root/  /usr/src/mvn/
WORKDIR /usr/src/mvn/
RUN rm -rf /usr/src/mvn/OT-Java-WebApp/src/main/resources/database.properties
ADD database.properties /usr/src/mvn/OT-Java-WebApp/src/main/resources/
RUN   mvn clean package -Dhttps.proxyHost=10.159.0.3 -Dhttps.proxyPort=8678 -Dhttps.nonProxyHosts=localhost
      
FROM tomcat:8.0-alpine
COPY --from=Build /usr/src/mvn/OT-Java-WebApp/target/Spring3HibernateApp.war /usr/local/tomcat/webapps/main.war
WORKDIR /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh" , "run"]
