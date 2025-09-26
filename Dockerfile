FROM ubuntu:latest AS BUILD_IMAGE
RUN apt update && apt install wget unzip -y
RUN wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
RUN unzip 2137_barista_cafe.zip && cd 2137_barista_cafe && tar -czf cafe.tgz * && mv cafe.tgz /root/cafe.tgz

FROM ubuntu:latest
LABEL "project"="Relaxing"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install apache2 git wget -y
COPY --from=BUILD_IMAGE /root/cafe.tgz /var/www/html/
RUN cd /var/www/html/ && tar -xzf cafe.tgz
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
WORKDIR /var/www/html/
EXPOSE 80
