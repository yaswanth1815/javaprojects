FROM openjdk:17-jre-slim

COPY GoldenYield.war app.war

EXPOSE $PORT

CMD ["java", "-Dserver.port=$PORT", "-jar", "app.war"]
