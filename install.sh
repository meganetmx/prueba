#!/bin/bash
apt-get update
apt-get -y install apache2 build-essential mysql-client php5 php5-mysql libcurl4-gnutls-dev libmysqlclient15-dev libapache2-mod-php5 curl php5-ssh2
apt-get -y install php5-imap php5-ldap php5-mysql php5-odbc php5-xmlrpc curl libapache2-mod-perl2 libxml2 php5-mysql php5-curl unzip zip sudo
apt-get -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python dos2unix ntp


dpkg-reconfigure tzdata
clear
UP=$(/etc/init.d/mysql status | grep running | grep -v not | wc -l);
if [ "$UP" -ne 1 ];
then

while true; do
DB=$(whiptail --inputbox "\nNombre de la Base de datos:" 9 66 mikrorocket --title "Mikro Rocket dev configuración de mysql-server" --nocancel 3>&1 1>&2 2>&3)
if [ -z "$DB" ]; then
  whiptail --title "Mikro Rocket dev configuración de mysql-server" --msgbox "\nDebe ingresar un nombre válido inténtalo de nuevo." 9 66
else
  break
fi
done

while true; do
PASSWORD=$(whiptail --passwordbox "\nContraseña para el usuario <<root>> de MySQL:" 9 66 --title "Mikro Rocket dev configuración de mysql-server" --nocancel 3>&1 1>&2 2>&3)
PASSCONFIRM=$(whiptail --passwordbox "\nConfirmar contraseña:" 9 66 --title "Mikro Rocket dev configuración de mysql-server" --nocancel 3>&1 1>&2 2>&3)
if [ -z "$PASSWORD" ]; then
  whiptail --title "Mikro Rocket dev configuración de mysql-server" --msgbox "\nPor seguridad debe ingresar una contraseña inténtalo de nuevo." 9 66
else  
	if [ "$PASSWORD" != "$PASSCONFIRM" ]; then
	 whiptail --title "Mikro Rocket dev configuración de mysql-server" --msgbox "\nLa contraseña no coincide inténtalo de nuevo." 9 66
	else
	  break
	fi
fi	
done

clear
echo "mysql-server mysql-server/root_password select $PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again select $PASSWORD" | debconf-set-selections
apt-get -y install mysql-server
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
apt-get install -y phpmyadmin

clear
echo "\nConfigurando base de datos..."
USERBD="$(tr -dc a-z0-9 < /dev/urandom | head -c 6 | xargs)"
PASSBD="$(tr -dc a-z0-9 < /dev/urandom | head -c 15 | xargs)"
mysql -u root -p$PASSWORD -e "DROP DATABASE IF EXISTS $DB;"
mysql -u root -p$PASSWORD -e "CREATE DATABASE $DB /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -u root -p$PASSWORD -e "CREATE USER $USERBD@localhost IDENTIFIED BY '$PASSBD';"
mysql -u root -p$PASSWORD -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USERBD'@'localhost';"
mysql -u root -p$PASSWORD -e "FLUSH PRIVILEGES;"
mysql --user=root --password=$PASSWORD --host=localhost $DB < mikrorocket.sql

echo "<?php\n \$DB_HOST=\"localhost\";\n \$DB_USER=\"$USERBD\";\n \$DB_NAME=\"$DB\";\n \$DB_PASSWORD=\"$PASSBD\";\n ?>" > www/core_system/app/config/db_conf.php

else

PASS=$(whiptail --passwordbox "\nIngrese la contraseña para el usuario <<root>> de MySQL:" 9 66 --title "Mikro Rocket configuración de mysql-server" --nocancel 3>&1 1>&2 2>&3)

while ! mysql -u root -p$PASS  -e ";" ; do
       PASS=$(whiptail --passwordbox "\nContraseña Incorrecta, inténtalo de nuevo: " 9 66 --title "Mikro Rocket configuración de mysql-server" --nocancel 3>&1 1>&2 2>&3)
done

echo "mysql-server mysql-server/root_password select $PASS" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again select $PASS" | debconf-set-selections
apt-get -y install mysql-server
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
apt-get install -y phpmyadmin

clear
echo "\nConfigurando base de datos..."
mysql -u root -p$PASS  -e "DROP DATABASE IF EXISTS $DB"
USERBD="$(tr -dc a-z0-9 < /dev/urandom | head -c 6 | xargs)"
PASSBD="$(tr -dc a-z0-9 < /dev/urandom | head -c 15 | xargs)"
mysql -u root -p$PASS -e "DROP DATABASE IF EXISTS $DB;"
mysql -u root -p$PASS -e "CREATE DATABASE $DB /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -u root -p$PASS -e "CREATE USER $USERBD@localhost IDENTIFIED BY '$PASSBD';"
mysql -u root -p$PASS -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USERBD'@'localhost';"
mysql -u root -p$PASS -e "FLUSH PRIVILEGES;"
mysql --user=root --password=$PASS --host=localhost $DB < mikrorocket.sql
echo "<?php\n \$DB_HOST=\"localhost\";\n \$DB_USER=\"$USERBD\";\n \$DB_NAME=\"$DB\";\n \$DB_PASSWORD=\"$PASSBD\";\n ?>" > www/core_system/app/config/db_conf.php

fi
echo "Instalando archivos de configuración..."
cp 000-default.conf /etc/apache2/sites-available/000-default.conf
rm 000-default.conf

cp php.ini /etc/php5/apache2/php.ini
cp php.ini /etc/php5/cli/php.ini
rm php.ini
service apache2 restart
echo "Instalando sistema..."
rm -r /var/www/html/
cp -r www /var/
rm -f -r www
chown -R www-data:www-data /var/www/
chmod 777 /var/www/
a2enmod rewrite
cp -f sudoers /etc/
rm sudoers
rm mikrorocket.sql
echo "Instalando servicios..."
crontab -l 2>/dev/null; echo '*/10 * * * * /usr/bin/php /var/www/automate/sclcron.php\n*/5 * * * * /usr/bin/php /var/www/automate/nclbill.php\n*/3 * * * * /usr/bin/php /var/www/automate/waipros.php\n*/20 * * * * /usr/bin/php /var/www/automate/ipstatus.php\n*/15 * * * * /usr/bin/php /var/www/automate/system.php\n*/6 * * * * /usr/bin/php /var/www/automate/queues.php' | crontab -u www-data -
myip=$(ip a s|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
whiptail --title "Mikro Rocket dev instalación terminada" --msgbox "\nFelicitaciones la instalación de Mikro Rocket ha finalizado.\n \nAcceso al sistema: http://${myip}/admin \nUsuario: admin\nContraseña: 123" 13 66
clear
echo "Reiniciando servidor..."
rm install.sh
sleep 2
reboot 