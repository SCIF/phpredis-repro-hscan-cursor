FROM php:8.3-bullseye

RUN apt-get update && apt-get install -y  git && \
			pecl channel-update pecl.php.net && \
			# install 6.1
			# pecl install redis && \
			# or install from `develop` branch
			cd /tmp && git clone https://github.com/phpredis/phpredis.git && cd phpredis && phpize && ./configure && make && make install && \
			docker-php-ext-enable redis && \
			apt-get purge -y --autoremove curl git libcurl4-openssl-dev libcurl4-openssl-dev && \
			apt-get autoremove --purge && apt-get clean && \
			rm -rf /var/lib/apt/lists/* /tmp/pear /usr/src/php /var/cache/* /var/log/apt /var/log/dpkg /var/log/*.log /tmp/phpredis
