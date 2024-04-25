#!/bin/sh

# Instal·lació
apt-get update
apt-get install -y apt-transport-https curl
curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc'
sh -c "echo 'deb https://mirror.mva-n.net/mariadb/repo/10.9/debian bullseye main' >>/etc/apt/sources.list"
apt-get update
apt-get install -y mariadb-server

# Importació sakila
wget -nv http://downloads.mysql.com/docs/sakila-db.tar.gz
tar xzf sakila-db.tar.gz
mysql < sakila-db/sakila-schema.sql
mysql < sakila-db/sakila-data.sql
rm sakila-db.tar.gz
rm -R sakila-db
