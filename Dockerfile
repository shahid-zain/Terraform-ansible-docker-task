FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt install -q -y apache2 libapache2-mod-php7.4 openssl php-imagick php7.4-common php7.4-curl php7.4-gd php7.4-imap php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-mysql php7.4-pgsql php-ssh2 php7.4-sqlite3 php7.4-xml php7.4-zip
RUN systemctl start apache2
RUN systemctl enable apache2
RUN wget https://downloads.joomla.org/cms/joomla3/3-9-26/Joomla_3-9-26-Stable-Full_Package.zip
RUN mkdir /var/www/html/joomla
RUN unzip Joomla_3-9-26-Stable-Full_Package.zip -d /var/www/html/joomla
RUN chown -R www-data:www-data /var/www/html/joomla
RUN chmod -R 755 /var/www/html/joomla
RUN systemctl restart apache2
RUN a2ensite joomla.conf
RUN a2enmod rewrite
RUN systemctl restart apache2
