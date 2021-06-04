FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt install apache2 unzip php7.2 php7.2-cli php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-intl php7.2-xml php7.2-gd  php7.2-zip php7.2-curl php7.2-xmlrpc php7.2-xmlrpc
RUN systemctl restart apache2
RUN mkdir -p /var/www/example.com
RUN cd /var/www/example.com
RUN wget https://downloads.joomla.org/cms/joomla3/3-9-4/Joomla_3-9-4-Stable-Full_Package.zip
RUN unzip Joomla_3-9-4-Stable-Full_Package.zip
RUN sudo chown -R www-data: /var/www/example.com
RUN systemctl restart apache2

