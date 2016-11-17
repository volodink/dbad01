#!/bin/bash

# определяем количество ядер для сборки
cpucount=$(grep -c ^processor /proc/cpuinfo)
cpucount=$(expr $cpucount + 1)
echo "CPU Cores: "$cpucount
sleep 5

# качаем PostgreSQL
wget https://ftp.postgresql.org/pub/source/v9.5.3/postgresql-9.5.3.tar.gz

# разархивируем в папку 	
tar -xzvf postgresql-9.5.3.tar.gz
rm -f postgresql-9.5.3.tar.gz
    
# компилируем postgresql
cd postgresql-9.5.3
./configure --prefix=/usr/local/pgsql
sleep 5
make -j$(cpucount) world
sleep 5
make check
sleep 5
	
# время установить PosgreSQL в систему
sudo make install-world
	
# добавляем пользователя postgres с паролем postgres
echo "adding postgres user. password: postgres"
sudo useradd -p .7BkIrW3xJCN. -m -d /home/postgres postgres
    	
# правим права доступа
echo "mkdir & chown"
sudo mkdir /usr/local/pgsql/data
sudo chown postgres /usr/local/pgsql/data
	
# init base cluster
sudo su -c "/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data" postgres
    	
# копируем файлы конфигурации
sudo cp /vagrant/conf/pg_hba.conf /usr/local/pgsql/data
sudo cp /vagrant/conf/postgresql.conf /usr/local/pgsql/data

# добавляем в переменные окружения пути и переменные
sudo su -c "echo '#postgres paths' >> ~/.profile" postgres
sudo su -c "echo 'export PATH=/usr/local/pgsql/bin:/usr/local/pgsql/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> ~/.profile" postgres
sudo su -c "echo 'export PGDATA=/usr/local/pgsql/data' >> ~/.profile" postgres
