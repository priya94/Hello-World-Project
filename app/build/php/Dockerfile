FROM ubuntu:16.04

ENV PROJECT=MyProject

RUN apt update
RUN apt-get install software-properties-common -y
RUN export LANG=C.UTF-8 && add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get install -my \
  curl \
  wget \
  php7.1 \
  php7.1-curl \
  php7.1-fpm \
  php7.1-gd \
  php7.1-xsl \
  php7.1-mysqlnd \
  php7.1-mcrypt \
  php7.1-cli \
  php7.1-intl \
  php7.1-bz2 \
  php7.1-zip \
  php7.1-mbstring \
  git \
  zip \
  php7.1-apcu \
  php7.1-redis \
  php7.1-opcache
RUN mkdir /run/php
COPY symfony/ /app/
ADD conf/www.conf /etc/php/7.1/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN ln -snf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime
WORKDIR /app
EXPOSE 9000
CMD ["./entry-point.sh"]
