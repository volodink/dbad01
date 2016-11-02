#!/bin/bash

# обновление пакетов основной ОС,
# установка дополнительных требуемых пакетов
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get upgrade -y
sudo apt-get install -y mc htop
sudo apt-get install -y build-essential gcc g++
sudo apt-get install -y git	
sudo apt-get install -y libpq-dev libreadline6-dev zlib1g zlib1g-dev
sudo apt-get install -y doxygen graphviz
	
