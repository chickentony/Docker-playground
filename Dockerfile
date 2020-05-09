FROM php:7.4-cli

RUN apt-get update && \
    apt-get install --assume-yes git

RUN mkdir -p /usr/src/myapp

WORKDIR /usr/src/myapp

COPY . /usr/src/myapp

RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer

CMD ["composer", "--version"]
