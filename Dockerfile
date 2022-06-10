FROM docker:rc
ENV DOCKER_VERSION rc
RUN apk add --no-cache --virtual .gyp python3 make g++
RUN apk add --no-cache bash vim git openjdk8 zip curl wget unzip curl ca-certificates perl coreutils nodejs


WORKDIR /home/maven
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
RUN tar xzf apache-maven-*.tar.gz
ENV MVN_HOME=/home/maven/apache-maven-3.8.5

ENV PATH $PATH:$MVN_HOME/bin

WORKDIR /sample
COPY src /sample/src
COPY pom.xml /sample
RUN java -version
RUN chmod 755  /home/maven/apache-maven-3.8.5/bin/mvn
RUN mvn -v
RUN mvn clean install

#COPY setup.sh /scripts/setup.sh
# run the app
CMD ["java", "-jar", "/sample/target/echo-0.0.1-SNAPSHOT.jar"]
