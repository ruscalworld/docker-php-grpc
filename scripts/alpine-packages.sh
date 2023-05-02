echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
apk --update add autoconf gcc g++ make zlib-dev linux-headers
