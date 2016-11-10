#!/bin/bash

# запускам сервер
sudo su -c "/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >/tmp/logfile 2>&1 &" postgres

