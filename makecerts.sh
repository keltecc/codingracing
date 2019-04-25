#!/bin/bash

HOSTNAME="coderacing.ruc.tf"

rm -rf "/tmp/certs/"
mkdir -p "/tmp/certs/"

if [ -d "./certs/" ]; then
	echo "certs exists!"
	exit
fi

mkdir -p "./certs/"

certbot -d "$HOSTNAME" \
	--config-dir "/tmp/certs/$HOSTNAME" \
	--work-dir "/tmp/certs/$HOSTNAME" \
	--logs-dir "/tmp/certs/$HOSTNAME" \
	certonly \
	--register-unsafely-without-email \
	--standalone \
	--agree-tos

certs_dir="/tmp/certs/$HOSTNAME/live/$HOSTNAME/"

cp "$certs_dir/fullchain.pem" "./certs/fullchain.pem"
cp "$certs_dir/privkey.pem" "./certs/privkey.pem"

openssl dhparam -out "./certs/dhparam.pem" 2048

echo "certs created!"

