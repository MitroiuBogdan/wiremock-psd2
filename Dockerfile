#FROM rodolpheche/wiremock

FROM openjdk:11
#FROM rodolpheche/wiremock

# COPY /__files  /__files
# COPY /mappings  /mappings
ARG environment

ENV wiremock wiremock-standalone-2.26.3.jar
ENV wiremock_body_transformer wiremock-body-transformer-1.1.7-SNAPSHOT.jar
ENV extension com.opentable.extension.BodyTransformer,com.opentable.extension.ThymeleafBodyTransformer
ENV env ${environment}

COPY /__files /__files
COPY /mappings /mappings


COPY /${wiremock_body_transformer} /${wiremock_body_transformer}
COPY /${wiremock} /${wiremock}

# COPY /wiremock-body-transformer-1.1.6.jar var/wiremock/extensions/

#WORKDIR /home/wiremock
#CMD ["java","-cp" ,"/var/wiremock/wiremock-body-transformer-1.1.8-SNAPSHOT:wiremock-standalone-2.26.3.jar","com.github.tomakehurst.wiremock.standalone.WireMockServerRunner" ,"--verbose" ,"--extensions" ,"com.opentable.extension.ThymeleafBodyTransformer"]
#VOLUME /home/wiremock
#CMD ["java","-jar", "/home/wiremock-standalone-2.27.2.jar","--extensions", "com.opentable.extension.ThymeleafBodyTransformer"]
#CMD ["--extensions", "com.opentable.extension.ThymeleafBodyTransformer"]
#CMD ["java","-jar","/wiremock-body-transformer-1.1.6.jar:wiremock-standalone-2.27.2.jar"]

EXPOSE 8090

#CMD ["java","-cp", "/wiremock-body-transformer-1.1.7-SNAPSHOT.jar:wiremock-standalone-2.26.3.jar","com.github.tomakehurst.wiremock.standalone.WireMockServerRunner", "--extensions", "com.opentable.extension.BodyTransformer,com.opentable.extension.ThymeleafBodyTransformer","--verbose","--https-port","8443"]
CMD java -cp /${wiremock_body_transformer}:${wiremock} com.github.tomakehurst.wiremock.standalone.WireMockServerRunner --extensions com.opentable.extension.BodyTransformer,com.opentable.extension.ThymeleafBodyTransformer --verbose --https-port 8443

#CMD ["java","-cp", "/var/extensions/wiremock-body-transformer-1.1.8-SNAPSHOT:wiremock-standalone-2.26.3.jar","com.github.tomakehurst.wiremock.standalone.WireMockServerRunner", "--verbose", "--https-port", "8443", "--max-request-journal-entries", "25000", "--jetty-header-buffer-size", "26384", "--extensions", "com.opentable.extension.BodyTransformer,com.opentable.extension.ThymeleafBodyTransformer"]

# nohup java -classpath 'wiremock-body-transformer-1.1.7-SNAPSHOT.jar:wiremock-standalone-2.26.3.jar' com.github.tomakehurst.wiremock.standalone.WireMockServerRunner --verbose --extensions com.opentable.extension.ThymeleafBodyTransformer --jetty-header-buffer-size 24576 > standalone_wiremock.log &
#CMD [ "java -cp /home/wiremock-body-transformer-1.1.8-SNAPSHOT.jar:/home/wiremock-standalone-2.26.3.jar com.github.tomakehurst.wiremock.standalone.WireMockServerRunner --verbose --extensions com.opentable.extension.ThymeleafBodyTransformer --jetty-header-buffer-size 24576 > standalone_wiremock.log &"]