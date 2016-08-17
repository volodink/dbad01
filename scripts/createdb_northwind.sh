#!/bin/bash

sudo su -c "/usr/local/pgsql/bin/createdb northwind" postgres
sudo su -c "/usr/local/pgsql/bin/psql -d northwind -a -f /vagrant_sql_data/northwind.sql" postgres