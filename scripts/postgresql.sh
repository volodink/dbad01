#!/bin/bash

# add postgresql 
wget https://ftp.postgresql.org/pub/source/v9.5.3/postgresql-9.5.3.tar.gz

# extract archive content	
tar -xzvf postgresql-9.5.3.tar.gz
rm -f postgresql-9.5.3.tar.gz
    
# compile postgresql
cd postgresql-9.5.3
./configure --prefix=/usr/local/pgsql
sleep 5
make -j4 world
sleep 5
make check
sleep 5
	
# install it
sudo make install-world
	
# add postgres user
echo "adding postgres user. password: postgres"
sudo useradd -p .7BkIrW3xJCN. -m -d /home/postgres postgres
    	
echo "mkdir & chown"
sudo mkdir /usr/local/pgsql/data
sudo chown postgres /usr/local/pgsql/data
	
# init base cluster and run server
sudo su -c "/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data" postgres
    	
# copy config files
sudo cp /vagrant/conf/pg_hba.conf /usr/local/pgsql/data
sudo cp /vagrant/conf/postgresql.conf /usr/local/pgsql/data
