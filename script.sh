#!/bin/bash
# Script para configurar um ambiente de desenvolvimento

# Nome do arquivo de log de erros
LOG_FILE="/tmp/script_errors.log"

# Limpar arquivo de log de erros
> "$LOG_FILE"

# Função para registrar mensagens de erro
log_error() {
  echo "[$(date)] Erro: $1" >> "$LOG_FILE"
}

# Atualizar sistema
sudo apt update && apt upgrade -y


# Instalar Google Chrome
cd /
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o Google Chrome."
fi
# Instalar curl
sudo apt install curl -y

# Instalar SSH e Vim
sudo apt install openssh-server vim -y
sudo systemctl enable ssh
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o vim openssh."
fi
# Instalar Python e pip
sudo apt install python3 python3-pip -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o python3."
fi

# Instalar Visual Studio Code
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code -y

# Instalar Java
sudo apt install default-jdk openjdk-8-jdk -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o default-jdk openjdk-8-jdk"
fi

# Instalar PHPStorm
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd -y
sudo snap install phpstorm --classic
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o phpstorm"
fi
# Instalar Postman
sudo snap install postman
if [ $? -ne 0 ]; then
  log_error "postman"
fi
# Instalar pacotes essenciais
sudo apt install -y vim build-essential net-tools
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o build-essential"
fi

# Clonar script do GitHub
cd /tmp
git clone https://github.com/operacoesti/scriptDev.git

# Instalar Atom
cd /tmp/scriptDev/
wget -O atom-amd64.deb https://github.com/atom/atom/releases/download/v1.60.0/atom-amd64.deb
sudo dpkg -i atom-amd64.deb
sudo apt install -f -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o atom"
fi

# Instalar Node.js e npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install nodejs npm -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o nodejs"
fi
# Instalar Docker
curl -fsSL https://get.docker.com | bash

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Instalar PHP 5.6
sudo apt install software-properties-common -y
sudo apt install -y git
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php5.6 -y
sudo apt install php5.6-bcmath -y
sudo apt install php5.6-cli -y
sudo apt install php5.6-common -y
sudo apt install php5.6-fpm -y
sudo apt install php5.6-gd -y
sudo apt install php5.6-imap -y
sudo apt install php5.6-intl -y
sudo apt install php5.6-ldap -y
sudo apt install php5.6-mbstring -y
sudo apt install php5.6-mcrypt -y 
sudo apt install php5.6-mysqlnd -y
sudo apt install php5.6-pdo -y
sudo apt install php5.6-curl -y
sudo apt install php-pear -y
sudo apt install php-apcu -y
sudo apt install php-geoip -y
sudo apt install php-igbinary -y
sudo apt install php-imagick -y
sudo apt install php-json -y
sudo apt install php-memcache -y
sudo apt install php-redis -y
sudo apt install php-xdebug -y
sudo apt install php5.6-zip -y
sudo apt install php5.6-pgsql -y
sudo apt install php5.6-pspell -y
sudo apt install php5.6-soaps -y
sudo apt install php5.6-xml -y
sudo apt install php5.6-xmlrpc -y  
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o php"
fi
# Instalar PHP 7.0
sudo apt install php7.0 -y
sudo apt install php7.0-bcmath -y
sudo apt install php7.0-cli -y
sudo apt install php7.0-common -y
sudo apt install php7.0-fpm -y
sudo apt install php7.0-gd -y
sudo apt install php7.0-imap -y
sudo apt install php7.0-intl -y
sudo apt install php7.0-ldap -y
sudo apt install php7.0-mbstring -y
sudo apt install php7.0-mcrypt -y
sudo apt install php7.0-mysqlnd -y
sudo apt install php7.0-pdo -y
sudo apt install php7.0-curl -y
sudo apt install php-pear -y
sudo apt install php-json -y
sudo apt install php-apcu -y
sudo apt install php-geoip -y
sudo apt install php-igbinary -y
sudo apt install php-imagick -y
sudo apt install php-memcache -y
sudo apt install php-redis -y
sudo apt install php-xdebug -y
sudo apt install php7.0-zip -y
sudo apt install php7.0-pgsql -y
sudo apt install php7.0-pspell -y
sudo apt install php7.0-soap -y
sudo apt install php7.0-xml -y
sudo apt install php7.0-xmlrpc -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o php"
fi
# Configurar PHP 5.6 como padrão
sudo rm -f /usr/bin/php
ln -s /usr/bin/php5.6 /usr/bin/php

# Instalar Composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer
sudo chmod +x /usr/bin/composer

# Instalar PHPUnit
wget https://phar.phpunit.de/phpunit-5.7.phar
sudo chmod +x phpunit-5.7.phar
sudo mv phpunit-5.7.phar /usr/local/bin/phpunit

# Configurar Nginx
sudo tar -xvf nginx.tgz
sudo apt install -y nginx
echo '127.0.0.1 rest.local admin.local rentcars-sf.local afiliados.local whitelabel.local' | sudo tee -a /etc/hosts

# Desabilitar SELinux
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config

# Criar grupo e diretório
addgroup nginx && useradd nginx nginx
if [[ ! -d /home/www ]] ; then
  sudo mkdir /home/www
  sudo chown ${UID}:nginx /home/www
  sudo chmod 775 /home/www
  sudo chmod g+s /home/www
  sudo chmod u+s /home/www
fi

# Configurar PHP 5.6 e 7.0
cd /tmp/scriptDev/php/5.6/
sudo mv -f www.conf /etc/php/5.6/fpm/pool.d/www.conf 
sudo mv -f php-fpm.conf /etc/php/5.6/fpm/php-fpm.conf
cd ~

cd /tmp/scriptDev/php/7.0/
sudo mv -f www.conf /etc/php/7.0/fpm/pool.d/www.conf 
sudo mv -f php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
cd ~


# Copiar chave para /etc/apt
cd /etc/apt 
sudo cp trusted.gpg trusted.gpg.d
cd ~

# Instalar serviços
sudo apt install memcached redis -y
sudo systemctl enable redis memcached php5.6-fpm php7.0-fpm nginx

# Configurar memcached
cd /tmp/scriptDev
sudo cat memcached > /etc/memcached.conf

# Configurar GRUB
cd /tmp/scriptDev
sudo cat grub > /etc/default/grub
sudo update-grub

# Desabilitar tmp na memória
sudo systemctl mask tmp.mount

# Remover Apache2
sudo apt remove apache2 apache2-bin apache2-data apache2-utils -y

# Instalar Terminator
sudo apt install terminator -y
if [ $? -ne 0 ]; then
  log_error "Erro ao instalar o terminator"
fi
# Instalar NVM
cd /tmp/scriptDev/
wget https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
chmod +x install.sh
sudo ./install.sh

# Configurar Nginx

cd /tmp/scriptDev/nginx/
sudo cat nginx.conf > /etc/nginx/nginx.conf

cd /tmp/scriptDev/nginx/conf.d/
sudo mv www-upstream56.conf /etc/nginx/conf.d/

cd /tmp/scriptDev/nginx/conf.d/
sudo mv www-upstream70.conf /etc/nginx/conf.d/

cd /tmp/scriptDev/nginx/conf.d/
sudo mv badbot_blocker.conf /etc/nginx/conf.d/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv admin.local.conf /etc/nginx/sites-available/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv afiliados.local.conf /etc/nginx/sites-available/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv apilocal.local.conf /etc/nginx/sites-available/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv partners.local.conf /etc/nginx/sites-available/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv rentcars-sf.local.conf /etc/nginx/sites-available/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv rest.local.conf /etc/nginx/sites-available/

cd /tmp/scriptDev/nginx/sites-available/
sudo mv whitelabel.local.conf /etc/nginx/sites-available/

cd ~

ln -s /etc/nginx/sites-available/admin.local.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/afiliados.local.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/apilocal.local.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/partners.local.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/rentcars-sf.local.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/rest.local.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/whitelabel.local.conf /etc/nginx/sites-enabled/

sudo mkdir /etc/nginx/ssl

cd /tmp/scriptDev/nginx/ssl/
sudo mv rentcars.self.crt /etc/nginx/ssl
sudo mv rentcars.self.key /etc/nginx/ssl
sudo mv rentcars.self.pem /etc/nginx/ssl

cd ~

# Adicionar usuário Nginx
sudo adduser nginx


# Reiniciar serviços
sudo systemctl restart nginx
sudo systemctl restart php5.6-fpm
sudo systemctl restart php7.0-fpm

# Copiar .bashrc para o diretório raiz
cd /tmp/scriptDev/
sudo cat bashrc > ~/.bashrc

#Monitoramento do Sistema
sudo apt install htop iotop iftop -y

# Se ocorrer um erro, chame a função log_error com uma mensagem descritiva
if [ $? -ne 0 ]; then
  log_error "Erro ao realizar alguma operação."
fi

# Mensagem de sucesso ou erro
if [ -s "$LOG_FILE" ]; then
  echo "Script de configuração concluído com erros. Consulte o arquivo $LOG_FILE para detalhes."
else
  echo "Script de configuração concluído com sucesso!"
fi


# Mensagem de sucesso
echo "Script de configuração concluído com sucesso!"