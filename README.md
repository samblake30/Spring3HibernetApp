# Spring3HibernetApp
The main goal of this awesome Java Webapp is to encourage people to dive deep in Java Application Architecture and how we can make delivery pipeline faster, easier and much reliable using Continous Integration.

Dependencies
The list of dependencies are not quite long but yes we do have some dependencies.

 Maven 3.X
 Java 8
 MySQL
 Docker(Only if you are willing to create a Dockerized Setup)
Needs to be Taken Care
This application connects with MySQL database. If you want to have a full-fledged running application, just do me a favor and edit these properties according to your database environment.

database.driver=com.mysql.jdbc.Driver
database.url=jdbc:mysql://mysql.okts-test:3306/employeedb
database.user=root
database.password=password
hibernate.dialect=org.hibernate.dialect.MySQLDialect
hibernate.show_sql=true
hibernate.hbm2ddl.auto=update
upload.dir=c:/uploads

#hi There
Here some imp parameters to change like 
--  database.url
--  database.user
--  database.password


This file needs to be edited first then start with building of the docker image 

Note : Here I have setup everything on a corporate Proxy so necessary environmental vairables are used.

How to Run
Manual Setup
Running this application manually is pretty straight forward.

For Compilation

mvn clean package
For Unit Tests

mvn test
For Deploying Artifact on Remote Repository

mvn deploy
There is some other cool stuff as well but I leave that up to you to explore it.

Dockerized Setup
Dockerized setup is much classier than manual setup. To achieve this you just have to do this:-

docker build -t opstree/spring3hibernate:latest -f Dockerfile .
That's it. It will create Tomcat Image having the war itself. Now just go and deploy the docker image anywhere you want.

Docker Compose Setup
docker-compose build
docker-compose up 
The compose file will spinup three containers:

Nginx (Ingress)
Spring3Hibernate (JAVA APP)
MySql (Database)
