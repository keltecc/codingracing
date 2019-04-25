#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "sudo please"
	exit
fi

HOSTNAME="ctf.kelte.cc"
TEST_CERT="--test-cert"

rm -rf "/tmp/certs/"
mkdir -p "/tmp/certs/"

if [ -d "./nginx/certs/" ]; then
	echo "certs exists!"
	exit
fi

mkdir -p "./nginx/certs/"

certbot -d "$HOSTNAME" $TEST_CERT \
	--config-dir "/tmp/certs/$HOSTNAME" \
	--work-dir "/tmp/certs/$HOSTNAME" \
	--logs-dir "/tmp/certs/$HOSTNAME" \
	certonly \
	--register-unsafely-without-email \
	--standalone \
	--agree-tos

certs_dir="/tmp/certs/$HOSTNAME/live/$HOSTNAME/"

cp "$certs_dir/fullchain.pem" "./nginx/certs/fullchain.pem"
cp "$certs_dir/privkey.pem" "./nginx/certs/privkey.pem"

openssl dhparam -out "./nginx/certs/dhparam.pem" 2048

echo "certs created!"

