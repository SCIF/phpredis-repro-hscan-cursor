FROM php:8.3-bullseye

RUN apt-get update && \
        pecl channel-update pecl.php.net && \
        pecl install --onlyreqdeps redis && \
        docker-php-ext-enable redis && \
    		apt-get purge -y --autoremove curl libcurl4-openssl-dev libcurl4-openssl-dev && \
        apt-get autoremove --purge && apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/pear /usr/src/php /var/cache/* /var/log/apt /var/log/dpkg /var/log/*.log
