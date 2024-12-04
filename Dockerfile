FROM php:8.3-bullseye

RUN apt-get update && \
        pecl channel-update pecl.php.net && \
        pecl install --onlyreqdeps  igbinary && \
        pecl install --onlyreqdeps --nobuild redis && \
    	  cd "$(pecl config-get temp_dir)/redis" && \
        phpize && \
        ./configure --enable-redis-igbinary && \
        make && make install  && \
        docker-php-ext-enable igbinary && \
        rm -rf "$(pecl config-get temp_dir)/redis" && \
        docker-php-ext-enable redis && \
    		apt-get purge -y --autoremove curl libcurl4-openssl-dev libcurl4-openssl-dev && \
        apt-get autoremove --purge && apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/pear /usr/src/php /var/cache/* /var/log/apt /var/log/dpkg /var/log/*.log
