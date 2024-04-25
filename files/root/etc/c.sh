#!/bin/sh

set -e -o pipefail

wget -4 -O- 'https://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | \
    awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > \
    chnroute.txt

