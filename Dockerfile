FROM ubuntu:latest
RUN apt update && apt install -y apache2
ADD index.html /var/www/html
ADD images/ /var/www/html/images
ADD styles/ /var/www/html/styles
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

