FROM maven

WORKDIR /build

COPY pom.xml .
RUN mvn versions:resolve-ranges && mvn dependency:copy-dependencies -DoutputDirectory=. && mv plantuml*.jar plantuml.jar

ENTRYPOINT ["java", "-jar", "plantuml.jar"]
